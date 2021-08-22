//
//  CurrentWeather.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/22.
//

import SwiftUI

struct CurrentWeather: View {
    @EnvironmentObject var webService: WebService
    
    
    var body: some View {
        VStack {
            if webService.currentLocation.depthOne == "서울" {
                Text("서울")
                    .font(.system(size: 24, weight: .heavy))
            } else {
                Text("\(webService.currentLocation.depthTwo)")
                    .font(.system(size: 24, weight: .heavy))
            }
            Text("\(weather.main)")
                .font(.system(size: 15, weight: .medium))
            Text("\(Int(webService.currentWeather.temp))°C")
                .font(.system(size: 48, weight: .semibold))
            
            Text("최고:28 최저:21")
                .font(.system(size: 15, weight: .medium))
        }
        .foregroundColor(.white)
    }
    
    var weather: Weather {
        if let weather = webService.currentWeather.weather.first {
            return weather
        }
        return Weather(main: "", description: "", icon: "")
    }
    
    
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
    }
}
