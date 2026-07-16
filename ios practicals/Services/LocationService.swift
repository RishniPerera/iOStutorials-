//  Created by Student 1 on 2026-07-10.
//  LocationService.swift
//  ios practicals
//

import Foundation
import CoreLocation
import Combine

class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let manager = CLLocationManager()

    @Published var latitude: Double?
    @Published var longitude: Double?

    override init() {
        super.init()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest

        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
            }


            func locationManager(
                _ manager: CLLocationManager,
                didUpdateLocations locations: [CLLocation]
            ) {

                guard let location = locations.last else {
                    return
                }

                DispatchQueue.main.async {

                    self.latitude = location.coordinate.latitude
                    self.longitude = location.coordinate.longitude

                    print(
                        "LOCATION UPDATED:",
                        self.latitude ?? 0,
                        self.longitude ?? 0
                    )
                }
            }


            func locationManager(
                _ manager: CLLocationManager,
                didFailWithError error: Error
            ) {

                print("LOCATION ERROR:", error.localizedDescription)
            }
        }
        
        
        
