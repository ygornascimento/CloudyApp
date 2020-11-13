//
//  SettingsTimeViewModel.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 04/11/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsTimeViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        UserDefaults.standard.removeObject(forKey: "timeNotation")
    }
    
    func testText_TwelveHour() {
        let viewModel = SettingsTimeViewModel(timeNotation: .twelveHour)
        
        XCTAssertEqual(viewModel.text, "12 Hour")
    }
    
    func testText_TwentyFourHour() {
        let viewModel = SettingsTimeViewModel(timeNotation: .twentyFourHour)
        
        XCTAssertEqual(viewModel.text, "24 Hour")
    }
    
    func testAccessoryType_Database_TwelveHour_ViewModel_TwelveHour() {
        //given
        let timeNotation = TimeNotation.twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: "timeNotation")
        
        //when
        let viewModel = SettingsTimeViewModel(timeNotation: .twelveHour)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Database_TwelveHour_ViewModel_TwentyFourHour() {
        //given
        let timeNotation = TimeNotation.twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: "timeNotation")
        
        //when
        let viewModel = SettingsTimeViewModel(timeNotation: .twentyFourHour)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }
    
    func testAccessoryType_Database_TwentyFourHour_ViewModel_TwentyFourHour() {
        //given
        let timeNotation = TimeNotation.twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: "timeNotation")
        
        //when
        let viewModel = SettingsTimeViewModel(timeNotation: .twentyFourHour)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.checkmark)
    }
    
    func testAccessoryType_Database_TwentyFourHour_ViewModel_TwelveHour() {
        //given
        let timeNotation = TimeNotation.twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: "timeNotation")
        
        //when
        let viewModel = SettingsTimeViewModel(timeNotation: .twelveHour)
        
        //then
        XCTAssertEqual(viewModel.accessoryType, UITableViewCell.AccessoryType.none)
    }

}
