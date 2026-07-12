//
//  HomeView.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var gameSession: GameSession
    @EnvironmentObject var locationService: LocationService
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("homeBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                // Dark overlay for better readability
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                
                
                VStack(spacing: 25) {
                    Spacer()
                    
                    Text("Play Hub")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    
                    Text("Select a game")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.9))
                    
                    
                    
                    NavigationLink {
                        TapFrenzyView()
                    } label: {
                        Text("Tap Frenzy")
                            .gameButtonStyle(color: .orange)
                    }
                    
                    
                    NavigationLink {
                        LightItUpView()
                    } label: {
                        Text("Light It Up")
                            .gameButtonStyle(color: .blue)
                    }
                    
                    
                    NavigationLink {
                        QuizRushView()
                    } label: {
                        Text("Quiz Rush")
                            .gameButtonStyle(color: .green)
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}
    // Button design for games
    extension View { func gameButtonStyle(color: Color) -> some View {
    self
        .frame(width: 220, height: 60)
        .background(color.opacity(0.9))
        .foregroundColor(.white)
        .font(.system(.title3, design: .rounded))
        .fontWeight(.heavy)
        .cornerRadius(18)
        .shadow(radius: 6)
} }
