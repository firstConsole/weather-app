//
//  TemperatureDetailView.swift
//  WeatherApp
//
//  Created by Алексей Артамонов on 12.06.2023.
//

import SwiftUI

struct TemperatureView: View {
    @State var plateColor: [Color] = [.indigo, .blue]
    @State var degree: Double = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: temperatureColor(),
                                     startPoint: UnitPoint(x: 0.5, y: 0),
                                     endPoint: UnitPoint(x: 0.7, y: 0.6)))
                .frame(width: 350, height: 150)
                .cornerRadius(20)
                .shadow(radius: 5)
            VStack {
                HStack {
                    Image(systemName: "thermometer.medium")
                        .foregroundColor(.white)
                        .font(Font.system(size: 30))
                    Text("Температура")
                        .foregroundColor(.white)
                        .font(Font.system(size: 30))
                        .fontWeight(.medium)
                }
                
                HStack {
                    Text("\(Int(degree))")
                        .foregroundColor(.white)
                        .font(Font.system(size: 30))
                        .fontWeight(.bold)
                        .padding(.top, 1)
                    Text("°C")
                        .foregroundColor(.white)
                        .font(Font.system(size: 30))
                        .fontWeight(.bold)
                        .padding(.top, 1)
                }
            }
        }
    }
}

struct TemperatureDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
