//
//  TemperatureDetail.swift
//  WeatherApp
//
//  Created by Алексей Артамонов on 12.06.2023.
//

import SwiftUI

extension TemperatureView {
    func temperatureColor() -> [Color] {
        if self.degree <= 0 {
            return [.indigo, .blue]
        } else if degree <= 10 {
            return [.orange, .blue]
        } else if degree <= 20 {
            return [.yellow, .orange]
        } else if degree >= 20 {
            return [.red, .orange]
        }
        return []
    }
}
