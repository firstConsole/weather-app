//
//  WindSpeedView.swift
//  WeatherApp
//
//  Created by Алексей Артамонов on 12.06.2023.
//

import SwiftUI

struct WindSpeedView: View {
    var windSpeed: Double
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: [.white, .clear],
                                     startPoint: UnitPoint(x: 0.5, y: 0),
                                     endPoint: UnitPoint(x: 0.7, y: 0.6)))
                .frame(width: 350, height: 150)
                .cornerRadius(20)
                .shadow(radius: 5)
            VStack {
                HStack {
                    Image(systemName: "wind")
                        .foregroundColor(.black)
                        .font(Font.system(size: 30))
                    Text("Скорость ветра")
                        .foregroundColor(.black)
                        .font(Font.system(size: 30))
                        .fontWeight(.medium)
                }
                
                HStack {
                    Text("\(Int(windSpeed))")
                        .foregroundColor(.black)
                        .font(Font.system(size: 30))
                        .fontWeight(.bold)
                        .padding(.top, 1)
                    Text("м/с")
                        .foregroundColor(.black)
                        .font(Font.system(size: 30))
                        .fontWeight(.bold)
                        .padding(.top, 1)
                }
            }
        }
    }
}

struct WindSpeedView_Previews: PreviewProvider {
    static var previews: some View {
        WindSpeedView(windSpeed: 10)
    }
}
