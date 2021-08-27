//
//  ContentView.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var webService: WebService
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Color(.systemIndigo)
                
                ScrollView {
                    VStack {
                        CurrentWeather()
                        
                        CustomBorder(borderwidth: geometry.size.width, borderheight: 0.4)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(Array(webService.hourlyWeather.enumerated()), id:\.0) { (index, hour) in
                                    if index < 24 {
                                        HourlyForecast(hourly: hour, index: index)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        
                        CustomBorder(borderwidth: geometry.size.width, borderheight: 0.4)
                        
                        ForEach(Array(webService.dailyWeather.enumerated()), id: \.0) { (index, daily) in
                            if index != 0 {
                                WeatherForecast(daily: daily)
                            }
                        }
                        
                        CustomBorder(borderwidth: geometry.size.width, borderheight: 0.4)
                        
                        CurrentWeatherInfo(current: webService.currentWeather)
                        
                        CustomBorder(borderwidth: geometry.size.width, borderheight: 0.4)
                        
                    }
                    .padding(.vertical, 50)
                    .frame(width: geometry.size.width)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

