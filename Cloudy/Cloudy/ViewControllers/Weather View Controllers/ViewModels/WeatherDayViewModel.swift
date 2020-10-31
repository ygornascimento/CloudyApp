//
//  WeatherDayViewModel.swift
//  Cloudy
//
//  Created by Ygor Nascimento on 30/10/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import UIKit

struct WeatherDayViewModel: WeatherDayPresentable {
    
    let weatherDayData: WeatherDayData
    
    private let dateFormatter = DateFormatter()
    
    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: weatherDayData.time)
    }
    
    var date: String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: weatherDayData.time)
    }
    
    var temperature: String {
        let min = format(temperature: weatherDayData.temperatureMin)
        let max = format(temperature: weatherDayData.temperatureMax)
        
        return "\(min) - \(max)"
    }
    
    var windSpeed: String {
        let windSpeed = weatherDayData.windSpeed
        
        switch UserDefaults.unitsNotation {
            case .imperial:
                return String(format: "%.f MPH", windSpeed)
            case .metric:
                return String(format: "%.f KPH", windSpeed.toKPH)
        }
    }
    
    var image: UIImage? {
        UIImage.imageForIcon(with: weatherDayData.icon)
    }
    
    private func format(temperature: Double) -> String {
        switch UserDefaults.temperatureNotation {
            case .fahrenheit:
                return String(format: "%.0f ºF", temperature)
            case .celsius:
                return String(format: "%.0f ºC", temperature.toCelcius)
        }
    }
}
