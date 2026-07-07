//
//  Game2- LevelProgression.swift
//  ios practicals
//
//  Created by Student 1 on 2026-06-16.
//

import SwiftUI

enum Level: String, CaseIterable {
    case L1 = "Level 1"
    case L2 = "Level 2"
    case L3 = "Level 3"
    case L4 = "Level 4"
    
    // Total column layouts based on slide specifications
    var columns: Int {
        switch self {
        case .L1: return 3 // 3 cards in a horizontal row
        case .L2: return 2 // 4 cards (2x2 layout)
        case .L3: return 3 // 6 cards (2x3 layout)
        case .L4: return 3 // 9 cards (3x3 layout)
        }
    }
    
    // Total cards to generate for the grid
    var totalCards: Int {
        switch self {
        case .L1: return 3
        case .L2: return 4
        case .L3: return 6
        case .L4: return 9
        }
    }
    
    // Time allocation window per target appearance
    var litWindowDuration: Double {
        switch self {
        case .L1: return 1.5
        case .L2: return 1.2
        case .L3: return 1.0
        case .L4: return 0.8
        }
    }
    
    // Target counts per phase update
    var targetsToLight: Int {
        switch self {
        case .L4: return 2 // Level 4 requires two concurrent targets
        default: return 1
        }
    }
    
    // glow color per tier escalation
    var glowColor: Color {
        switch self {
        case .L1: return .green
        case .L2: return .yellow
        case .L3: return .orange
        case .L4: return .red
        }
    }
}
