//
//  StatsView.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import SwiftUI

struct StatsTab: View {
    var body: some View {
        VStack(spacing: 20) {

            Text("Statistics")
                .font(.largeTitle)
                .bold()

            Text("Highest Tap Frenzy Score: 0")

            Text("Highest Light It Up Score: 0")

            Text("Highest Quiz Rush Score: 0")

        }
        .padding()
    }
}

#Preview {
    StatsTab()
}
