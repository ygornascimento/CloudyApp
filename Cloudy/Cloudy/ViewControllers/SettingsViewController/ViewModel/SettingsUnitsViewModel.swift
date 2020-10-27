//
//  SettingsUnitsViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 27/10/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsUnitsViewModel {
    
    let unitsNotation: UnitsNotation
    
    var text: String {
        switch unitsNotation {
            case .imperial:
                return "Imperial"
            case .metric:
                return "Metric"
        }
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.unitsNotation == unitsNotation {
            return .checkmark
        } else {
            return .none
        }
    }
}
