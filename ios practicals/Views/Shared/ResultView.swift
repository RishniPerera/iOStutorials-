//
//  ResultView.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import Foundation
struct ResultView: Identifiable, Codable {

    let id: UUID
    let gameName: String
    let score: Int
    let date: Date


    init(gameName: String, score: Int) {
        self.id = UUID()
        self.gameName = gameName
        self.score = score
        self.date = Date()
    }
}
