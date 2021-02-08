//
//  WeatherModel.swift
//  Weather
//
//  Created by Miroslav Hnát on 09.01.2021.
//

import Foundation


struct WeatherModel {
    let cityName: String
    let temperature: Double
    let conditionId: Int
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        
        switch conditionId{
        case 200...232: //thunderstorm
            return "cloud.bolt"
        case 300...321: //drizzle
            return "cloud.drizzle"
        case 500...531: //rain
            return "cloud.rain"
        case 600...622: //Snow
            return "cloud.snow"
        case 700...781: // Atmosphere
            return "cloud.fog"
        case 800: //Clear
            return "sun.max"
        case 801...804: //Clouds
            return "cloud.sun"
        default:
            return "cloud"
        }
    }
}
