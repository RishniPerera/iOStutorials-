//
//  MainTabView.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import SwiftUI


struct MainTab: View {
    var body: some View {
        TabView {

            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            StatsTab()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Stats")
                }

            MapTab()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }

            
            ProfileTab()
                    .tabItem {
                        Label("Profile",
                        systemImage:"person")
                    }
    
            SettingsTab()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    MainTab()
}
