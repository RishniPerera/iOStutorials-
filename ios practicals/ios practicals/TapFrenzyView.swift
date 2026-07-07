//
//  ContentView.swift
//  ios practicals
//
//  Created by Student 1 on 2026-06-06.
//
import SwiftUI

<<<<<<<< HEAD:ios practicals/ios practicals/ContentView.swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()
                
                // App Title
                VStack(spacing: 8) {
                    Text("🕹️ Game Hub ")
                        .font(.system(size: 36, weight: .black, design: .rounded))
                    Text("Select a game mode to begin")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Navigation Buttons
                VStack(spacing: 20) {
                    NavigationLink(destination: TapFrenzyView()) {
                        MenuButtonView(title: "🔥 Tap Frenzy", subtitle: "Tap to score high", color: .orange)
                    }
                    
                    NavigationLink(destination: LightItUpView()) {
                        MenuButtonView(title: "⚡ Light It Up", subtitle: "Tap before go dark", color: .blue)
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
    }
}

// Reusable custom button style for a polished look
struct MenuButtonView: View {
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
========
struct TapFrenzyView: View {
    @StateObject private var game = TapFrenzyVM()
    @State private var score = 0
    @State private var timeRemaining = 10
    @State private var gameOver = false
    @State private var multiplier = 1
    @State private var lastTapTime: Date? = nil
    @State private var buttonColor: Color = .blue
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let colorTimer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            // Background
            LinearGradient(
                colors: [.purple, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            if gameOver {
                
                // game over screen
                VStack(spacing: 25) {
                    
                    Text("GAME OVER !")
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(.red)
                    
                    Text("Final Score")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("\(score)")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundColor(.yellow)
                    
                    Button(action: resetGame) {
                        Text("Play Again")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 220, height: 60)
                            .background(Color.green)
                            .cornerRadius(20)
                    }
                }
                
            } else {
                
                // main game screen
                VStack(spacing: 30) {
                    
                    Text("Tap Frenzy ")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.white)
                    
                    Text("Tap as fast as you can!")
                        .foregroundColor(.yellow)
                        .italic()
                    
                    HStack(spacing: 20) {
                        
                        VStack {
                            Text("Score")
                            Text("\(score)")
                                .font(.title)
                                .bold()
                        }
                        
                        VStack {
                            Text("Time")
                            Text("\(timeRemaining)")
                                .font(.title)
                                .bold()
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(.black.opacity(0.3))
                    .cornerRadius(15)
                    
                    Text("Combo x\(multiplier)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.yellow)
                    
                    Button(action: {
                        handleTap()
                    }) {
                        Text("CLICK!")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 180, height: 180)
                            .background(buttonColor)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 5)
                            )
                            .shadow(radius: 10)
                    }
                    .disabled(gameOver)
                    
                    Text(
                        buttonColor == .green ?
                        "BONUS!" :
                        buttonColor == .gray ?
                        "PENALTY!" :
                        "NORMAL"
                    )
                    .font(.headline)
                    .bold()
                    .foregroundColor(buttonColor)
                }
                .padding()
                
                // Countdown Timer
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    } else {
                        gameOver = true
                    }
                }
                
                // Button color timer
                .onReceive(colorTimer) { _ in
                    if !gameOver {
                        let colors: [Color] = [.green, .gray, .blue]
                        buttonColor = colors.randomElement() ?? .blue
                    }
                }
>>>>>>>> main:ios practicals/ios practicals/TapFrenzyView.swift
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .font(.title2)
        }
<<<<<<<< HEAD:ios practicals/ios practicals/ContentView.swift
        .padding()
        .background(color.gradient)
        .cornerRadius(15)
        .shadow(color: color.opacity(0.4), radius: 8, x: 0, y: 4)
========
    }
    
    // game logic
    func handleTap() {
        let now = Date()
        if let lastTap = lastTapTime {
            let diff = now.timeIntervalSince(lastTap)
            if diff <= 0.5 {
                multiplier += 1
            } else {
                multiplier = 1
            }
        }
        
        lastTapTime = now
        if buttonColor == .green {
            score += 2 * multiplier
        } else if buttonColor == .gray {
            score -= 1
        } else {
            score += 1 * multiplier
        }
    }
    
    // reset game
    func resetGame() {
        score = 0
        timeRemaining = 10
        multiplier = 1
        lastTapTime = nil
        buttonColor = .blue
        gameOver = false
>>>>>>>> main:ios practicals/ios practicals/TapFrenzyView.swift
    }
}

#Preview {
    TapFrenzyView()
}
