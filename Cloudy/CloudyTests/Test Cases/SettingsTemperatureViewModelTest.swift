//
//  SettingsTemperatureViewModelTest.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 04/11/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsTemperatureViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        UserDefaults.standard.removeObject(forKey: "temperatureNotation")
    }
    
    func testText_Celsius() {
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .celsius)
        
        XCTAssertEqual(viewModel.text, "Celsius")
    }
    
    func testText_Fahrenheit() {
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .fahrenheit)
        
        XCTAssertEqual(viewModel.text, "Fahrenheit")
    }
    
    func testAccessoryType_Database_Celsius_ViewModel_Celsius() {
        //given
        let temperatureNotation = TemperatureNotation.celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        //when
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .celsius)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Database_Celsius_ViewModel_Fahrenheit() {
        //given
        let temperatureNotation = TemperatureNotation.celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        //when
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .fahrenheit)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }
    
    func testAccessoryType_Database_Fahrenheit_ViewModel_Fahrenheit() {
        //given
        let temperatureNotation = TemperatureNotation.fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        //when
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .fahrenheit)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Database_Fahrenheit_ViewModel_Celsius() {
        //given
        let temperatureNotation = TemperatureNotation.fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: "temperatureNotation")
        
        //when
        let viewModel = SettingsTemperatureViewModel(temperatureNotation: .celsius)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }

}
