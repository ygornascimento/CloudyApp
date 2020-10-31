//
//  WeekViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 26/10/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import UIKit

struct WeekViewModel {
    
    let weatherData: [WeatherDayData]
    private let dateFormatter = DateFormatter()
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfDays: Int {
        weatherData.count
    }
    
    func viewModel(for index: Int) -> WeatherDayViewModel {
        WeatherDayViewModel(weatherDayData: weatherData[index])
    }
}
