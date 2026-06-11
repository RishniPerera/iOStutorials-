//
//  ContentView.swift
//  ios practicals
//
//  Created by Student 1 on 2026-06-06.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var score = 0
    @State private var timeRemaining = 10
    @State private var gameOver = false
    
    @State private var multiplier = 1
    @State private var lastTapTime: Date? = nil
    
    @State private var buttonColor: Color = .blue
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let colorTimer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        if gameOver {
            VStack(spacing: 25) { //game over screen
                
                Text("Game Over")
                    .font(.largeTitle)
                    .bold()
                
                Text("Final Score: \(score)")
                    .font(.title)
                
                Button(action: resetGame) {
                    Text("Play Again")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 60)
                        .background(Color.green)
                        .cornerRadius(15)
                }
            }
        }
        else {
            
            VStack(spacing: 30) { // game screen
                
                Text("Tap Frenzy")
                    .font(.largeTitle)
                    .bold()
                
                Text("Score: \(score)")
                    .font(.title)
                
                Text("Multiplier: x\(multiplier)")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Text("Time: \(timeRemaining)")
                    .font(.title2)
                
                Button(action: {
                    handleTap()
                }) {
                    Text("Click")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 120)
                        .background(buttonColor)
                        .clipShape(Circle())
                }
                .disabled(gameOver)
            }
            .padding()
            
            // Timer
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    gameOver = true
                }
            }
            
            // change color every seconds
            .onReceive(colorTimer) { _ in
                if !gameOver {
                    let colors: [Color] = [.green, .gray, .blue]
                    buttonColor = colors.randomElement() ?? .blue
                }
            }
        }
    }
    
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
    func resetGame() {
        score = 0
        timeRemaining = 10
        multiplier = 1
        lastTapTime = nil
        buttonColor = .blue
        gameOver = false
    }
}

#Preview {
    ContentView()
}
