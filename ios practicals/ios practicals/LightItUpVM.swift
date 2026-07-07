//
//  LightItUpVM.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import SwiftUI
import Combine


class LightItUpVM: ObservableObject {


    @Published var score = 0
    @Published var timeRemaining = 60
    @Published var isGameActive = false
    @Published var litCardIndex: Int? = nil


    @AppStorage("lightItUpHighScore")
    var highScore = 0
    var currentLevel: Level {

        if timeRemaining <= 15 {
            return .L4
        }
        else if timeRemaining <= 30 {
            return .L3
        }
        else if timeRemaining <= 45 {
            return .L2
        }
        else {
            return .L1
        }
    }



    func startGame() {

        score = 0
        timeRemaining = 60
        isGameActive = true

        changeLitCard()
    }



    func updateTimer() {

        guard isGameActive else {
            return
        }


        if timeRemaining > 0 {

            timeRemaining -= 1

            changeLitCard()

        }
        else {

            finishGame()

        }
    }



    func changeLitCard() {

        litCardIndex = Int.random(
            in: 0..<currentLevel.totalCards
        )

    }



    func tapCard(_ index: Int) {


        if index == litCardIndex {

            score += 10

            changeLitCard()

        }
        else {

            score = max(0, score - 5)

        }

    }



    func finishGame() {

        isGameActive = false

        litCardIndex = nil


        if score > highScore {

            highScore = score

        }

    }


}
