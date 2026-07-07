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

    func saveScore(gameName: String, score: Int) {


        let newGame = ResultView(
            gameName: gameName,
            score: score
        )


        games.append(newGame)

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
