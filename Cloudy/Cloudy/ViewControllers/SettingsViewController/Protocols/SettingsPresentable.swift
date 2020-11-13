//
//  SettingsPresentable.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 28/10/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import UIKit

protocol SettingsPresentable {
    var text: String { get }
    var accessoryType: UITableViewCell.AccessoryType { get }
}
