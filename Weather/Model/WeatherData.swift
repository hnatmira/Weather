//
//  WeatherData.swift
//  Weather
//
//  Created by Miroslav Hnat  on 01.01.2021.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main:Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}


