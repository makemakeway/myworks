//
//  WeatherForecast.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/23.
//

import Foundation
import SwiftUI
import Kingfisher

struct WeatherForecast: View {
    let daily: Daily
    let time: Date
    let formatter = DateFormatter()
    let calender = Calendar.current
    let month: Int
    let day: Int
    let icon: String?
    let weatherImage = WeatherImage()
    
    init(daily: Daily) {
        self.daily = daily
        self.time = Date(timeIntervalSince1970: daily.dt)
        self.month = calender.component(.month, from: time)
        self.day = calender.component(.day, from: time)
        self.icon = self.daily.weather.first?.icon
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("\(month)/\(day)")
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "\(weatherImage.iconToQuery[self.icon ?? ""] ?? "")")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                
                Spacer()
                    
                Text("\(Int(round(daily.temp.maxTemp)))")
                    .foregroundColor(.white)
                
                Text("\(Int(round(daily.temp.minTemp)))")
                    .foregroundColor(.orange)
            }
            .font(.system(size: 20, weight: .medium))
        }
        
    }
}
