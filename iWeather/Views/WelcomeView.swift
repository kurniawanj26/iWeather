//
//  WelcomeView.swift
//  iWeather
//
//  Created by Jayadi Kurniawan on 17/01/25.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to iWeather")
                    .bold().font(.title)
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .symbolVariant(.fill)
            .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity )
    }
}

#Preview {
    WelcomeView()
}
