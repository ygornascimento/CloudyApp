//
//  WeekViewModelTest.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 07/11/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

final class WeekViewModelTest: XCTestCase {
    
    var viewModel: WeekViewModel!

    override func setUpWithError() throws {
        let data = loadStub(name: "weather", extension: "json")
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let weatherData = try decoder.decode(WeatherData.self, from: data)
        
        viewModel = WeekViewModel(weatherData: weatherData.dailyData)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }
    
    func testNumbersOfDays() {
        XCTAssertEqual(viewModel.numberOfDays, 8)
    }
    
    func testViewModelForIndex() {
        let weatherDayViewModel = viewModel.viewModel(for: 5)
        
        XCTAssertEqual(weatherDayViewModel.day, "Friday")
        XCTAssertEqual(weatherDayViewModel.date, "June 26")
    }

}
