//
//  SettingsUnitsViewModelTest.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 04/11/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsUnitsViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        UserDefaults.standard.removeObject(forKey: "unitsNotation")
    }
    
    func testText_Imperial() {
        let viewModel = SettingsUnitsViewModel(unitsNotation: .imperial)
        
        XCTAssertEqual(viewModel.text, "Imperial")
    }
    
    func testText_Metric() {
        let viewModel = SettingsUnitsViewModel(unitsNotation: .metric)
        
        XCTAssertEqual(viewModel.text, "Metric")
    }
    
    func testAccessoryType_Database_Imperial_ViewModel_Imperial() {
        //given
        let unitsNotation = UnitsNotation.imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: "unitsNotation")
        
        //when
        let viewModel = SettingsUnitsViewModel(unitsNotation: .imperial)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Database_Imperial_ViewModel_Metric() {
        //given
        let unitsNotation = UnitsNotation.imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: "unitsNotation")
        
        //when
        let viewModel = SettingsUnitsViewModel(unitsNotation: .metric)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }
    
    func testAccessoryType_Database_Metric_ViewModel_Metric() {
        //given
        let unitsNotation = UnitsNotation.metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: "unitsNotation")
        
        //when
        let viewModel = SettingsUnitsViewModel(unitsNotation: .metric)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Database_Metric_ViewModel_Imperial() {
        //given
        let unitsNotation = UnitsNotation.metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: "unitsNotation")
        
        //when
        let viewModel = SettingsUnitsViewModel(unitsNotation: .imperial)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }

}
