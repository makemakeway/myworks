//
//  CurrentTemp.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/26.
//

import SwiftUI

struct CurrentTemp: View {
    @EnvironmentObject var webService: WebService
    private var dailyWeather: Daily {
        if let daily = webService.dailyWeather.first {
            return daily
        }
        return Daily(dt: 0, sunrise: 0, sunset: 0, temp: DailyTemp(minTemp: 0, maxTemp: 0), weather: [])
    }
    
    var body: some View {
        VStack {
            Text("\(Int(webService.currentWeather.temp))°")
                .font(.system(size: 64, weight: .light))
            
            
            Text("최고:\(Int(dailyWeather.temp.maxTemp))°, 최저:\(Int(dailyWeather.temp.minTemp))°")
                .font(.system(size: 18, weight: .medium))
        }
        .foregroundColor(.white)
        
    }
}
