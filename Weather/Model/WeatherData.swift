//
//  WeatherData.swift
//  Weather
//
//  Created by Miroslav Hnat  on 01.01.2021.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
}

struct Main:Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}


