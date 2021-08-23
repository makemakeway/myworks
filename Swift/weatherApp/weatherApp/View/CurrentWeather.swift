//
//  CurrentWeather.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/22.
//

import SwiftUI

struct CurrentWeather: View {
    @EnvironmentObject var webService: WebService
    
    // MARK: Default Value
    private var weather: Weather {
        if let weather = webService.currentWeather.weather.first {
            return weather
        }
        return Weather(main: "", description: "", icon: "")
    }
    private var dailyWeather: Daily {
        if let daily = webService.dailyWeather.first {
            return daily
        }
        return Daily(dt: 0, sunrise: 0, sunset: 0, temp: DailyTemp(minTemp: 0, maxTemp: 0), weather: [])
    }
    
    
    var body: some View {
        VStack {
            if webService.currentLocation.depthOne == "서울" {
                Text("서울")
                    .font(.system(size: 32, weight: .heavy))
            } else {
                Text("\(webService.currentLocation.depthTwo)")
                    .font(.system(size: 32, weight: .heavy))
            }
            Text("\(weather.main)")
                .font(.system(size: 18, weight: .medium))
            Text("\(Int(round(webService.currentWeather.temp)))°")
                .font(.system(size: 64, weight: .medium))
            
            
            Text("최고:\(Int(round(dailyWeather.temp.maxTemp)))°, 최저:\(Int(round(dailyWeather.temp.minTemp)))°")
                .font(.system(size: 18, weight: .medium))
        }
        .foregroundColor(.white)
    }
    
    
}
