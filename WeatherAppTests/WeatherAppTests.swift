//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Алексей Артамонов on 11.06.2023.
//

import XCTest
@testable import WeatherApp

final class WeatherAppTests: XCTestCase {
    
    // MARK: - Properties
    
    private var apiClient = APIClient()
    private var weatherManager = WeatherManager(city: "Moscow")
    
    // MARK: - Class methods

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testGetData() {
        let decoder = JSONDecoder()
        
        let expected: [WeatherModel] = []
        
        guard let path = Bundle.main.path(forResource: "weather", ofType: "json"),
              let jsonData = try? Data(contentsOf: URL(filePath: path), options: .mappedIfSafe),
              let data = try? decoder.decode(WeatherModel.self, from: jsonData) else {
            return
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
