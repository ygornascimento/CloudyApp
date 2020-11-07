//
//  WeatherDayViewModelTest.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 07/11/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

final class WeatherDayViewModelTest: XCTestCase {

    var viewModel: WeatherDayViewModel!
    
    override func setUpWithError() throws {
        let data = loadStub(name: "weather", extension: "json")
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let weatherData = try decoder.decode(WeatherData.self, from: data)
        
        viewModel = WeatherDayViewModel(weatherDayData: weatherData.dailyData[5])
    }

    override func tearDownWithError() throws {
        UserDefaults.standard.removeObject(forKey: "unitsNotation")
        UserDefaults.standard.removeObject(forKey: "temperatureNotation")
    }
    
    func testDay() {
        XCTAssertEqual(viewModel.day, "Friday")
    }
    
    func testDate() {
        XCTAssertEqual(viewModel.date, "June 26")
    }
    
    func testTemperature_Fahrenheit() {
        let temperatureNotation = TemperatureNotation.fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        XCTAssertEqual(viewModel.temperature, "65 ºF - 83 ºF")
    }
    
    func testTemperature_Celsius() {
        let temperatureNotation = TemperatureNotation.celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        XCTAssertEqual(viewModel.temperature, "18 ºC - 28 ºC")
    }
    
    func testWindSpeed_Imperial() {
        let unitsNotation = UnitsNotation.imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: "unitsNotation")
        
        print(viewModel.windSpeed)
        
        XCTAssertEqual(viewModel.windSpeed, "6 MPH")
    }
    
    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = viewModelImage!.pngData()!
        let imageDataReference = UIImage(named: "clear-day")!.pngData()!
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 236.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }

}
