//
//  ScoreBadge.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-16.
//

import SwiftUI

struct ScoreBadge: View {

    let score: Int

    // Badge name
    var badgeName: String {

        if score >= 100 {
            return "Gold"
        } else if score >= 50 {
            return "Silver"
        } else if score >= 20 {
            return "Bronze"
        } else {
            return "Keep Playing"
        }
    }

    // Badge description
    var badgeMessage: String {

        if score >= 100 {
            return "Amazing Score!"
        } else if score >= 50 {
            return "Great Job!"
        } else if score >= 20 {
            return "Nice Work!"
        } else {
            return "Try Again!"
        }
    }

    // SF symbol for badges
    @ViewBuilder
    var badgeIcon: some View {

        if score >= 100 {

            Image(systemName: "trophy.fill")
                .font(.system(size: 55))
                .foregroundStyle(.yellow)

        } else if score >= 50 {

            Image(systemName: "rosette")
                .font(.system(size: 55))
                .foregroundStyle(.gray)

        } else if score >= 20 {

            Image(systemName: "medal.fill")
                .font(.system(size: 55))
                .foregroundStyle(.orange)

        } else {

            Image(systemName: "gamecontroller.fill")
                .font(.system(size: 55))
                .foregroundStyle(.blue)

        }

    }

    var body: some View {

        VStack(spacing: 10) {

            badgeIcon

            Text("\(badgeName) Badge")
                .font(.title2)
                .bold()

            Text(badgeMessage)
                .font(.headline)
                .foregroundColor(.secondary)

        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(100)
        .shadow(radius: 5)

    }
}

#Preview {
    VStack(spacing: 20) {

        ScoreBadge(score: 10)

        ScoreBadge(score: 30)

        ScoreBadge(score: 70)

        ScoreBadge(score: 120)

    }
    .padding()
}
