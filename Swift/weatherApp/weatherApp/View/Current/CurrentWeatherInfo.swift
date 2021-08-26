//
//  CurrentWeatherInfo.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/24.
//

import SwiftUI

struct CurrentWeatherInfo: View {
    let current: Current
    private let sunriseTime: Date
    private let sunsetTime: Date
    private let calender = Calendar.current
    private let sunrise: String
    private let sunset: String
    
    init(current: Current) {
        self.current = current
        let formatter = DateFormatter()
        self.sunriseTime = Date(timeIntervalSince1970: self.current.sunrise)
        self.sunsetTime = Date(timeIntervalSince1970: self.current.sunset)
        formatter.dateFormat = "a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        self.sunrise = formatter.string(from: self.sunriseTime)
        self.sunset = formatter.string(from: self.sunsetTime)
    }
    
    var body: some View {
        
        
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                CustomBorder(borderwidth: .infinity, borderheight: 0.3)
                InfoCell(placeholder: "일출", info: "\(self.sunrise)")
                CustomBorder(borderwidth: .infinity, borderheight: 0.3)
                InfoCell(placeholder: "체감", info: "\(Int(self.current.feels_like))°")
                CustomBorder(borderwidth: .infinity, borderheight: 0.3)
                InfoCell(placeholder: "가시거리", info: "\(self.current.visibility / 1000)km")
                CustomBorder(borderwidth: .infinity, borderheight: 0.3)
                InfoCell(placeholder: "기압", info: "\((self.current.pressure))hPa")
            }
            VStack(alignment: .leading) {
                CustomBorder(borderwidth: .infinity, borderheight: 0.3)
                InfoCell(placeholder: "일몰", info: "\(self.sunset)")
                CustomBorder(borderwidth: .infinity, borderheight: 0.3)
                InfoCell(placeholder: "습도", info: "\(Int(self.current.humidity))%")
                CustomBorder(borderwidth: .infinity, borderheight: 0.3)
                InfoCell(placeholder: "풍속", info: "\(self.current.wind_speed)m/s")
                CustomBorder(borderwidth: .infinity, borderheight: 0.3)
                InfoCell(placeholder: "자외선 지수", info: "\(Int(self.current.uvi))")
            }
        }
        .padding(.horizontal)
        
        
        
    }
}

