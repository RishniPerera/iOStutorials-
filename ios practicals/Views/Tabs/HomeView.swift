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
            VStack(spacing: 25) {

                Text("Play Hub")
                    .font(.largeTitle)
                    .bold()

                Text("Select a game")
                    .foregroundColor(.gray)
                Button("Test Save Score") {


                    gameSession.saveScore(
                        gameName: "Quiz Rush",
                        score: 45,
                        latitude: locationService.latitude ?? 0,
                        longitude: locationService.longitude ?? 0)
                }


                NavigationLink {
                    TapFrenzyView()
                } label: {
                    Text("Tap Frenzy")
                        .frame(width: 220, height: 60)
                        .background(.orange)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }


                NavigationLink {
                    LightItUpView()
                } label: {
                    Text("Light It Up")
                        .frame(width: 220, height: 60)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }


                NavigationLink {
                    QuizRushView()
                } label: {
                    Text("Quiz Rush")
                        .frame(width: 220, height: 60)
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
        }
    }
}
