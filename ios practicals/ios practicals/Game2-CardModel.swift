//
//  CardModel.swift
//  ios practicals
//
//  Created by Student 1 on 2026-06-16.
//

import Foundation

struct Card: Identifiable {
    let id: Int
    var isLit: Bool = false // Tracks if this target is active and ready to be tapped
}
