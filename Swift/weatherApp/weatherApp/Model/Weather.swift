//
//  Weather.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/22.
//

import Foundation

struct WeatherResponse: Codable {
    let current: Current
    let daily: [Daily]
    
    private enum CodingKeys: String, CodingKey {
        case current = "current"
        case daily = "daily"
    }
}

struct Current: Codable {
    var temp: Double
    var feels_like: Double
    let clouds: Int
    let wind_speed: Double
    let weather: [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feels_like = "feels_like"
        case clouds = "clouds"
        case wind_speed = "wind_speed"
        case weather = "weather"
    }
}

struct Daily: Codable {
    var dt: Double
    var sunrise: Double
    var sunset: Double
    var temp: DailyTemp
    var weather: [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case temp = "temp"
        case weather = "weather"
    }
}

struct DailyTemp: Codable {
    var minTemp: Double
    var maxTemp: Double
    
    private enum CodingKeys: String, CodingKey {
        case minTemp = "min"
        case maxTemp = "max"
    }
}

struct Weather: Codable {
    let main: String
    let description: String
    let icon: String
    
    private enum CodingKeys: String, CodingKey {
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}
