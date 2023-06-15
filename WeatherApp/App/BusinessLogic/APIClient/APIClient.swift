//
//  APIClient.swift
//  WeatherApp
//
//  Created by Алексей Артамонов on 12.06.2023.
//
// API KEY -> 5493415f9b4e4c139a0144450231206

import SwiftUI
import Combine

final class APIClient {
    // MARK: - Properties
    
    var cancellable = Set<AnyCancellable>()
    
    // MARK: - Class methods
    
    func getURL(scheme: String?,
                host: String?,
                path: String,
                queryItems: [URLQueryItem]?) -> URL? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        return urlComponents.url
    }
}
