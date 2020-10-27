//
//  SettingsTemperatureViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 27/10/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsTemperatureViewModel {
    
    let temperatureNotation: TemperatureNotation
    
    var text: String {
        switch temperatureNotation {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
        }
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.temperatureNotation == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }
}
