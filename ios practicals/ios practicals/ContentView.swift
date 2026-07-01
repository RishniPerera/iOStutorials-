//
//  ContentView.swift
//  ios practicals
//
//  Created by Student 1 on 2026-06-06.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Spacer()
                
                // App Title
                VStack(spacing: 8) {
                    Text(" Game Hub ")
                        .font(.system(size: 36, weight: .black, design: .rounded))
                    Text("Select a game mode to begin")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Navigation Buttons
                VStack(spacing: 20) {
                    NavigationLink(destination: TapFrenzyView()) {
                        MenuButtonView(title: " Tap Frenzy", subtitle: "Tap to score high", color: .orange) .frame(maxWidth: .infinity)
                    }
                    
                    NavigationLink(destination: LightItUpView()) {
                        MenuButtonView(title: " Light It Up", subtitle: "Tap before go dark", color: .blue).frame(maxWidth: .infinity)
                    }
                    NavigationLink(destination: QuizRushView()) {
                        MenuButtonView(title: " Quiz Rush ", subtitle: " live Trivia ", color: .green).frame(maxWidth: .infinity)
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
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .font(.title2)
        }
        .padding()
        .background(color.gradient)
        .cornerRadius(15)
        .shadow(color: color.opacity(0.4), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    ContentView()
}
