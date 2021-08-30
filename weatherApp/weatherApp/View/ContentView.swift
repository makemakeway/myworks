//
//  ContentView.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var webService: WebService
    @State var offset: CGFloat = 0
    @State var scrollUp: Double = 100.0
    
    func getTitleOffset() -> CGFloat {
        let progress = offset/120
        let newOffset = (progress <= 1.0 ? progress : 1) * 20
        return newOffset
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Color(.systemIndigo)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        CurrentWeather()
                            .offset(y: -offset)
                            .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                            .offset(y: self.getTitleOffset())
                        
                        
                        
                        withAnimation {
                            CurrentTemp()
                                .opacity((Double(self.offset) + self.scrollUp) / 100)
                        }
                        
                        
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
                    .overlay(
                        GeometryReader { proxy -> Color in
                            let minY = proxy.frame(in: .global).minY
                            
                            DispatchQueue.main.async {
                                self.offset = minY
                                print(self.offset)
                            }
                            
                            return Color.clear
                        }
                    )
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

