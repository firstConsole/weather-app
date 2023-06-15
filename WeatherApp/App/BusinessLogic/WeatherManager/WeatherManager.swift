//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Алексей Артамонов on 12.06.2023.
//

import Foundation
import Combine

final class WeatherManager: ObservableObject {
    @Published var weatherData: [WeatherModel] = []
    var city: String
    var cancellable = Set<AnyCancellable>()
    
    init(city: String) {
        self.city = city
    }
    
    func getWeather() {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "key", value: "5493415f9b4e4c139a0144450231206"),
            URLQueryItem(name: "q", value: city)
        ]
        
        var urlComponents = URLComponents()
        urlComponents.host = "api.weatherapi.com"
        urlComponents.scheme = "https"
        urlComponents.path = "/v1/current.json"
        urlComponents.queryItems = queryItems
        
        getRequest(with: urlComponents.url)
    }
    
    func getRequest(with url: URL?) {
        guard let url = url else {
            print("Broken URL \(String(describing: url?.description))")
            fatalError("Can't create URL")
        }
        
        let publisher = URLSession.shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: WeatherModel.self, decoder: JSONDecoder())
        
        publisher
            .sink { [weak self] completion in
                guard let self = self else {
                    return
                }
                
                if case .failure(let error) = completion {
                    print(error)
                }
                print(completion)
                print(self.weatherData)
            } receiveValue: { [weak self] data in
                guard let self = self else {
                    return
                }
                
                self.weatherData.append(data)
            }
            .store(in: &cancellable)
    }
}
