//
//  HourlyForecast.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/26.
//

import SwiftUI

struct HourlyForecast: View {
    let hourly: Hourly
    let index: Int
    private let weatherImage = WeatherImage()
    private let time: Date
    private let whatTime: String
    private var weather: Weather {
        if let weather = hourly.weather.first {
            return weather
        }
        return Weather(main: "", description: "", icon: "")
    }
    
    init(hourly: Hourly, index: Int) {
        self.hourly = hourly
        self.index = index
        self.time = Date(timeIntervalSince1970: self.hourly.dt)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a h"
        self.whatTime = formatter.string(from: time)
    }
    
    
    
    var body: some View {
        VStack {
            if self.index != 0 {
                Text("\(self.whatTime)시")
                    .font(.system(size: 18))
            } else {
                Text("지금")
                    .font(.system(size: 18, weight: .semibold))
            }
            
            Image(systemName: "\(weatherImage.iconToQuery[self.weather.icon] ?? "")")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
            
            Text("\(Int(hourly.temp))°")
                .font(.system(size: 18, weight: .semibold))
        }
        .foregroundColor(.white)
    }
}
