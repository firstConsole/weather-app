//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Алексей Артамонов on 12.06.2023.
//

import SwiftUI

struct WelcomeView: View {
    @State private var cities: [String] = ["Moscow", "London", "Boston"]
    @State var chosenCity: String = "Moscow"
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Ваш город",
                       selection: $chosenCity) {
                    ForEach(cities, id: \.self) { city in
                        Text(city)
                    }
                }
                       .pickerStyle(.wheel)
                
                NavigationLink("Далее") {
                    TabBarView(city: chosenCity)
                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .navigationTitle(Text("Выберите город"))
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
