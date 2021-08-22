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
    private let locationManager = CLLocationManager()
    @Published var currentWeather: Current = Current(temp: 0, feels_like: 0, clouds: 0, wind_speed: 0, weather: [])
    @Published var currentLocation: Address = Address(depthOne: "서울", depthTwo: "구로구", depthThree: "구로동")
    
    init() {
        DispatchQueue.main.async {
            self.getWeather()
            self.getLocation()
        }
    }
    
    // MARK: API KEYS
    private var weatherApiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "ApiKey", ofType: "plist") else {
                fatalError("ApiKey.plist not founded.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "OPENWEATHERAPI_KEY") as? String else {
                fatalError("Couldn't find key [OPENWEATHERAPI_KEY]")
            }
            return value
        }
    }
    
    private var kakaoApiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "ApiKey", ofType: "plist") else {
                fatalError("ApiKey.plist not founded")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "KAKAOAPI_KEY") as? String else {
                fatalError("Couldn't find key [KAKAOAPI_KEY]")
            }
            return value
        }
    }
    
    // MARK: GET X, Y Position
    func getLatAndLon() -> [Double?] {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        } else {
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
        }
        guard let coor = locationManager.location?.coordinate else { fatalError("coordinate failed..") }
        let lat = coor.latitude
        let lon = coor.longitude
        print(lat, lon)
        return [lat, lon]
    }
    
    // MARK: API CALLS
    
    func getWeather() {
        let gps = getLatAndLon()
        guard let lat = gps[0] else { fatalError("latitude nil..") }
        guard let lon = gps[1] else { fatalError("longtitude nil..") }
        
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,alert,hourly,daily&appid=\(weatherApiKey)"
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
                        // MARK: Kelvin to Celsius
                        self.currentWeather.temp = round(self.currentWeather.temp - 273.15)
                        self.currentWeather.feels_like = round(self.currentWeather.feels_like - 273.15)
                        
                        print(json)
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
        guard let lat = gps[0] else { return }
        guard let lon = gps[1] else { return }
        
        let urlString = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x=\(lon)&y=\(lat)&input_coord=WGS84"
        let headers: HTTPHeaders = ["Authorization":"KakaoAK \(kakaoApiKey)"]
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
