//
//  ProfileTab.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-16.
//

import Foundation
import SwiftUI


struct ProfileTab: View {
    @EnvironmentObject var gameSession: GameSession
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient( colors:
                  [ Color.blue.opacity(0.8),
                    Color.white,
                    Color.green.opacity(0.35) ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing ) .ignoresSafeArea()
                
                VStack(spacing:25) {
                    Spacer()
                    //profile picture
                    Image(viewModel.profile.profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width:145, height:145)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth:4)
                        )
                        .shadow(radius:10)
                    
                    //player name
                    Text(viewModel.profile.name)
                        .font(.largeTitle)
                        .bold()
                    
                    ProfileCard(
                        title: "Games Played",
                        value: "\(viewModel.profile.gamesPlayed)"
                    )
                    
                    ProfileCard(
                        title: "Highest Score",
                        value: "\(viewModel.profile.highestScore)"
                    )
                    
                    
                    ProfileCard(
                        title: "Favourite Game",
                        value: viewModel.profile.favouriteGame
                    )
                    
                    
                    ProfileCard(
                        title: "Achievements",
                        value:
                            "\(viewModel.profile.achievementsUnlocked)/\(viewModel.profile.totalAchievements)"
                    )
                    
                    
                    Spacer()
                    
                }
                .padding()
                .navigationTitle("Profile")
                .onAppear {
                    
                    viewModel.updateProfile(
                        from: gameSession.games
                    )
                }
            }
        }
    }
    
    struct ProfileCard: View {
        let title:String
        let value:String

        var body: some View {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
                Text(value)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.blue)
            }
            .padding()
            .background(.white.opacity(0.15))
            .cornerRadius(15)
            // border around card
            .overlay( RoundedRectangle(cornerRadius: 15)
            .stroke( Color.blue.opacity(0.35),
             lineWidth: 1) )
            // Soft shadow
            .shadow( color: Color.black.opacity(0.08),
            radius: 4, x: 0, y: 3 )
        }
        
    }
}
