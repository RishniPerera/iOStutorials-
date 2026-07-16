//
//  TapFrenzyVM.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import SwiftUI
import Combine

class TapFrenzyVM: ObservableObject {

    @Published var score = 0
    @Published var timeLeft = 10
    @Published var isGameOver = false
    @Published var multiplier = 1
    @Published var buttonColor: Color = .blue

    private var lastTap: Date?


    func tap() {

        let now = Date()
        if let previousTap = lastTap {
            let gap = now.timeIntervalSince(previousTap)
            if gap <= 0.5 {
                multiplier += 1
            }
            else {
                multiplier = 1
            }
        }

        lastTap = now


        if buttonColor == .green {

            score += 2 * multiplier

        }
        else if buttonColor == .gray {

            score -= 1

        }
        else {

            score += multiplier

        }
    }


    func countdown() {

        if timeLeft > 0 {

            timeLeft -= 1

        }
        else {

            isGameOver = true

        }
    }


    func changeColor() {

        let colors: [Color] = [
            .blue,
            .green,
            .gray
        ]

        buttonColor = colors.randomElement() ?? .blue
    }


    func reset() {

        score = 0
        timeLeft = 10
        multiplier = 1
        buttonColor = .blue
        isGameOver = false
        lastTap = nil
    }
}
