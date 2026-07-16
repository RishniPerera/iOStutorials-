//
//  ProfileViewModel.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-16.
//

import Foundation
import Combine


class ProfileViewModel: ObservableObject {


    @Published var profile = PlayerProfile()



    func updateProfile(from games: [ResultView]) {


        profile.gamesPlayed = games.count


        if let highest = games.max(by: { $0.score < $1.score }) {

            profile.highestScore = highest.score

            profile.favouriteGame = highest.gameName

        }


        profile.achievementsUnlocked =
        min(games.count / 2, 10)

    }

}
