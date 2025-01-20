//
//  ContentView.swift
//  iWeather
//
//  Created by Jayadi Kurniawan on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    
    // to get the view notified when the LocationManager updated
    @StateObject var locationManager = LocationManager()
    var weatheManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                //Text("Your coordinates are:  \(location.longitude), \(location.latitude)")
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView().task {
                        do {
                            weather = try await weatheManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.622, saturation: 0.758, brightness: 0.544))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
