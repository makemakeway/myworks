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
    let calender = Calendar.current
    let icon: String?
    let weatherImage = WeatherImage()
    let whatDay: String
    
    init(daily: Daily) {
        let formatter = DateFormatter()
        self.daily = daily
        self.time = Date(timeIntervalSince1970: daily.dt)
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier: "ko_KR")
        self.whatDay = formatter.string(from: time)
        self.icon = self.daily.weather.first?.icon
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("\(whatDay)")
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "\(weatherImage.iconToQuery[self.icon ?? ""] ?? "")")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                
                Spacer()
                    
                Text("\(Int(daily.temp.maxTemp))")
                    .foregroundColor(.white)
                
                Text("\(Int(daily.temp.minTemp))")
                    .foregroundColor(.orange)
            }
            .font(.system(size: 20, weight: .medium))
            .padding(.horizontal)
        }
        
    }
}
