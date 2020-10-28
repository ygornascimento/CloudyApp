//
//  SettingsTimeViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 27/10/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsTimeViewModel: SettingsPresentable {
    
    let timeNotation: TimeNotation
    
    var text: String {
        switch timeNotation {
            case .twelveHour:
                return "12 Hour"
            case .twentyFourHour:
                return "24 Hour"
        }
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.timeNotation == timeNotation {
            return .checkmark
        } else {
            return .none
        }
    }
}
