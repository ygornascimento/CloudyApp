//
//  DayViewModelTest.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 06/11/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

final class DayViewModelTest: XCTestCase {
    
    var viewModel: DayViewModel!
    
    override func setUpWithError() throws {
        let data  = loadStub(name: "weather", extension: "json")
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let weatherData = try decoder.decode(WeatherData.self, from: data)
        
        viewModel = DayViewModel(weatherData: weatherData)
    }
    
    override func tearDownWithError() throws {
        UserDefaults.standard.removeObject(forKey: "timeNotation")
        UserDefaults.standard.removeObject(forKey: "unitsNotation")
        UserDefaults.standard.removeObject(forKey: "temperatureNotation")
    }
    
    func testDate() {
        XCTAssertEqual(viewModel.date, "Mon, Jun 22")
    }
    
    func testTime_TwelveHour() {
        let timeNotation = TimeNotation.twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: "timeNotation")
        
        XCTAssertEqual(viewModel.time, "11:53 AM")
    }
    
    func testTime_TwentyFourHour() {
        let timeNotation = TimeNotation.twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: "timeNotation")
        
        XCTAssertEqual(viewModel.time, "11:53")
    }
    
    func testSummary() {
        XCTAssertEqual(viewModel.sumary, "Overcast")
    }
    
    func testTemperature_Fahrenheit() {
        let temperatureNotation = TemperatureNotation.fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        XCTAssertEqual(viewModel.temperature, "68.7 ºF")
    }
    
    func testTemperature_Celsius() {
        let temperatureNotation = TemperatureNotation.celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        XCTAssertEqual(viewModel.temperature, "20.4 ºC")
    }
    
    func testWindSpeed_Imperial() {
        let unitsNotation = UnitsNotation.imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: "unitsNotation")
        
        print(viewModel.windSpeed)
        
        XCTAssertEqual(viewModel.windSpeed, "6 MPH")
    }
    
    func testWindSpeed_Metric() {
        let unitsNotation = UnitsNotation.metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: "unitsNotation")
        
        print(viewModel.windSpeed)
        
        XCTAssertEqual(viewModel.windSpeed, "10 KPH")
    }
    
    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = viewModelImage!.pngData()!
        let imageDataReference = UIImage(named: "cloudy")!.pngData()!
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 172.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }
}
