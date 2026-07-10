//
//  MapTab.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-07.
//

import SwiftUI
import MapKit

struct MapTab: View {
    @EnvironmentObject var gameSession: GameSession
    @State private var cameraPosition: MapCameraPosition =
            .region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 6.9271,longitude: 79.8612),
                    span: MKCoordinateSpan(latitudeDelta: 2.0,longitudeDelta: 2.0)
                )
            )
    
    var body: some View {
        NavigationStack {

            VStack {

                            Text("Saved Games: \(gameSession.games.count)")
                                .padding()

                            Map(position: $cameraPosition) {

                                ForEach(gameSession.games) { game in

                                    Marker(
                                        game.gameName,
                                        coordinate: CLLocationCoordinate2D(
                                            latitude: game.latitude,
                                            longitude: game.longitude
                                        )
                                    )
                                }
                            }

                        }
                      
                   .navigationTitle("Game Map")
                    .onAppear {

                               print("Total games:", gameSession.games.count)

                               for game in gameSession.games {
                                   print(
                                       game.gameName,
                                       "Latitude:",
                                       game.latitude,
                                       "Longitude:",
                                    game.longitude
                                 )
                              }
                          }

                      }
                }
                }
#Preview {
  MapTab()
   .environmentObject(GameSession())
    
}
