//
//  getLocation.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/22.
//

import Foundation
import SwiftUI
import CoreLocation
import Alamofire

class WebService: ObservableObject {
    let locationManager = CLLocationManager()
    
    @Published var currentWeather: Current = Current(temp: 0, feels_like: 0, clouds: 0, wind_speed: 0, weather: [], sunrise: 0, sunset: 0, pressure: 0, uvi: 0, humidity: 0, visibility: 0)
    @Published var currentLocation: Address = Address(depthOne: "서울", depthTwo: "구로구", depthThree: "구로동")
    @Published var dailyWeather = [Daily]()
    @Published var hourlyWeather = [Hourly]()
    @Published private var hasPermission = false
    
    init() {
        DispatchQueue.main.async {
            self.getWeather()
            self.getLocation()
        }
    }
    
    // MARK: Get API Key From plist
    private func getApiKey(ApiKey: String) -> String {
        guard let filePath = Bundle.main.path(forResource: "ApiKey", ofType: "plist") else {
            fatalError("ApiKey.plist not founded.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: ApiKey) as? String else {
            fatalError("Couldn't find key [\(ApiKey)]")
        }
        return value
    }
    
    // MARK: GET X, Y Position
    func getLatAndLon() -> [Double?] {
        locationManager.requestWhenInUseAuthorization()
        
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            print("권한 있음")
            self.hasPermission = true
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            guard let coor = locationManager.location?.coordinate else { fatalError("coordinate failed..") }
            let lat = coor.latitude
            let lon = coor.longitude
            return [lat, lon]
        case .notDetermined:
            print("아직 선택되지않음")
            self.hasPermission = false
        case .denied, .restricted:
            print("권한 요청 거부당함")
            self.hasPermission = false
        default:
            break
        }
        return [36.35111, 127.38500]
    }
    
    // MARK: API CALLS
    
    func getWeather() {
        let gps = getLatAndLon()
        let apiKey = getApiKey(ApiKey: "OPENWEATHERAPI_KEY")
        guard let lat = gps[0] else { fatalError("latitude nil..") }
        guard let lon = gps[1] else { fatalError("longtitude nil..") }
        
        
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,alert&appid=\(apiKey)&units=metric"
        AF.request(urlString, method: .get, encoding: URLEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let json = try decoder.decode(WeatherResponse.self, from: data)
                        self.currentWeather = json.current
                        self.dailyWeather = json.daily
                        self.hourlyWeather = json.hourly
                    } catch {
                        print(error)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getLocation() {
        let gps = getLatAndLon()
        let apiKey = getApiKey(ApiKey: "KAKAOAPI_KEY")
        guard let lat = gps[0] else { return }
        guard let lon = gps[1] else { return }
        
        let urlString = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x=\(lon)&y=\(lat)&input_coord=WGS84"
        let headers: HTTPHeaders = ["Authorization":"KakaoAK \(apiKey)"]
        AF.request(urlString,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let json = try decoder.decode(LocationResponse.self, from: data)
                        json.documents.forEach({ address in
                            self.currentLocation = address.address
                        })
                    } catch {
                        print(error)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
}
