//
//  TabBarView.swift
//  WeatherApp
//
//  Created by Алексей Артамонов on 12.06.2023.
//

import SwiftUI

struct TabBarView: View {
    var city: String
    
    init(city: String) {
        self.city = city
    }
    
    var body: some View {
        TabView {
            WeatherView(weatherManager: WeatherManager(city: city))
                .tabItem {
                    Label("Погода", systemImage: "aqi.medium")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(city: "Moscow")
    }
}
