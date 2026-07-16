
//  StatsTab.swift
//  ios practicals
//

import SwiftUI
import Charts

struct StatsTab: View {
    @EnvironmentObject var gameSession: GameSession
    var tapFrenzyHighest: Int {

        gameSession.games
            .filter { $0.gameName == "Tap Frenzy" }
            .map { $0.score }
            .max() ?? 0

    }

    var lightItUpHighest: Int {

        gameSession.games
            .filter { $0.gameName == "Light It Up" }
            .map { $0.score }
            .max() ?? 0

    }

    var quizRushHighest: Int {

        gameSession.games
            .filter { $0.gameName == "Quiz Rush" }
            .map { $0.score }
            .max() ?? 0

    }
    var chartData: [(String, Int)] {

            [

                ("Tap Frenzy", tapFrenzyHighest),

                ("Light It Up", lightItUpHighest),

                ("Quiz Rush", quizRushHighest)

            ]

        }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing:25) {
                    Text("Statistics")
                        .font(.largeTitle)
                        .bold()

                    // Total Games
                    VStack {
                        Text("Total Games Played")
                            .font(.headline)
                        Text("\(gameSession.totalGames)")
                            .font(.system(size:45))
                            .bold()
                    }
                    .frame(maxWidth:.infinity)
                    .padding()
                    .background(.blue.opacity(0.2))
                    .cornerRadius(15)

                    
                    // Highest scores

                    VStack(spacing:15) {
                        Text("Highest Scores")
                            .font(.title2)
                            .bold()

                        Text("Tap Frenzy: \(tapFrenzyHighest)")
                        Text("Light It Up: \(lightItUpHighest)")
                        Text("Quiz Rush: \(quizRushHighest)")
                    }

        
                    .frame(maxWidth:.infinity)
                    .padding()
                    .background(.green.opacity(0.2))
                    .cornerRadius(15)

                    VStack {


                    Text("Score Chart")
                    .font(.title2)
                    .bold()
                    .padding(.bottom)
                      Chart(chartData, id: \.0) { item in
                                                BarMark(

                                                    x: .value("Game", item.0),

                                                    y: .value("Score", item.1)

                                                )


                                            }
                                            .frame(height:250)



                                        }
                                        .frame(maxWidth:.infinity)
                                        .padding()
                                        .background(.orange.opacity(0.2))
                                        .cornerRadius(15)

                    // Recent Games

                    VStack(alignment:.leading) {


                        Text("Recent Games")
                            .font(.title2)
                            .bold()

                        ForEach(gameSession.recentGames) { game in
                            HStack {
                                VStack(alignment:.leading) {
                                    Text(game.gameName)
                                        .font(.headline)

                                    Text(game.date.formatted())
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text("\(game.score)")
                                    .font(.title3)
                                    .bold()
                            }
                            .padding()

                            Divider()
                        }


                    }
                    .padding()
                }
                .padding()

            }
            .navigationTitle("Stats")

        }


    }

}

#Preview {

    StatsTab()
        .environmentObject(GameSession())

}
