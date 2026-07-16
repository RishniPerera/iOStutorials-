//
//  GameSession.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import Foundation
import Combine


class GameSession: ObservableObject {


    @Published var games: [ResultView] = []


    init() {
        loadScores()
    }

    func saveScore(
           gameName: String,
           score: Int,
           latitude: Double,
           longitude: Double
       ) {  let result = ResultView(
        gameName: gameName,
        score: score,
        latitude: latitude,
        longitude: longitude
    )
           games.append(result)
               print("Game:", result.gameName)
               print("Score:", result.score)
               print("Latitude:", result.latitude)
               print("Longitude:", result.longitude)
               print("Total Games:", games.count)
           
         //  print("Saving game:", gameName)
         //  print("Saving location:", latitude, longitude)
         //  print("Games count after save:", games.count)
           
         //  let newGame = ResultView(
          //     gameName: gameName,
          //     score: score,
          //     latitude: latitude,
          //     longitude: longitude
          //
        

        //games.append(newGame)
         //  print("Games after append:", games.count)

        saveScores()
    }


    func saveScores() {

        if let encoded = try? JSONEncoder().encode(games) {

            UserDefaults.standard.set(
                encoded,
                forKey: "savedGames"
            )
        }
    }

    func loadScores() {

        guard let data = UserDefaults.standard.data(
            forKey: "savedGames"
        )
        else {
            return
        }


        if let decoded = try? JSONDecoder().decode(
            [ResultView].self,
            from: data
        ){

            games = decoded
            print("Loaded Games:", games.count)
            for game in games {
                        print(game.gameName)
                        print(game.score)
                        print(game.latitude)
                        print(game.longitude)
                    }

                } else {

                    print("Failed to load saved games.")
                }
            }
    
    
    func resetScores(){

        games.removeAll()

        saveScores()
    }



    var totalGames: Int {

        games.count
    }



    var highestScore: Int {

        games.map {
            $0.score
        }
        .max() ?? 0
    }



    var recentGames: [ResultView] {

        games.sorted {
            $0.date > $1.date
        }
    }

}
