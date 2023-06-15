//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Алексей Артамонов on 11.06.2023.
// 

import SwiftUI
import Combine

struct WeatherView: View {
    @State var windSpeed: Double = 10
    @State var date: Date = .now
    @ObservedObject var weatherManager: WeatherManager
    
    init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }
    
    var body: some View {
            ScrollView {
                VStack {
                    ForEach(weatherManager.weatherData) { data in
                        Image(systemName: "sun.haze")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.top, 30)
                        
                        Text(weatherManager.city)
                            .font(Font.system(size: 48))
                            .fontWeight(.medium)
                        
                        Text(data.current.lastUpdatedTime)
                        
                        TemperatureView(degree: data.current.celsiusTemp)
                        WindSpeedView(windSpeed: data.current.windSpeed)
                    }
                    
                    Spacer()
                }
                .navigationTitle(Text("Weather"))
            }
            .onAppear {
                weatherManager.getWeather()
            }
    }
}

struct WeatherView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        WeatherView(weatherManager: WeatherManager(city: "Moscow"))
    }
}
