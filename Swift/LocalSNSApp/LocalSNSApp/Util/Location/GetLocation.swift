//
//  GetLocation.swift
//  LocalSNSApp
//
//  Created by 박연배 on 2021/08/16.
//
import SwiftUI
import CoreLocation
import Alamofire

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class CurrentLocation: ObservableObject {
    @Published var location: Location?
    var latitude: String?
    var longtitude: String?
    private var locationManager: CLLocationManager!
    private var realAddress: [String:String]?
    
    func getLocation(completion: @escaping (Location?) -> Void) {
        if let url = URL.fetchUrl(latitude ?? Constants.DEFAULT_LATITUDE, longtitude ?? Constants.DEFAULT_LONGTITUDE) {
            
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: JSONEncoding.prettyPrinted,
                       headers: ["Authorization":"KakaoAK e3d4333c6e985cec3c772679d7b596e1"])
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let documents = value as? [String:(Any)] ?? [:]
                        let document = documents["documents"] ?? ""
                        let address = document as? [[String:Any]] ?? [[:]]
                        for addressType in address {
                            self.realAddress = addressType["address"] as? [String:String] ?? [:]
                        }
                        guard let depthOne = self.realAddress?["region_1depth_name"] else { return }
                        guard let depthTwo = self.realAddress?["region_2depth_name"] else { return }
                        guard let depthThree = self.realAddress?["region_3depth_name"] else { return }
                        completion(Location(depthOneAddr: depthOne, depthTwoAddr: depthTwo, depthThreeAddr: depthThree))
                    case .failure(let error):
                        print(error.localizedDescription)
                        
                    }
                }.resume()
        }
    }
    
    
    init() {
        self.getLocation { location in
            self.location = location
        }
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        let coor = locationManager.location?.coordinate
        
        self.latitude = String(coor?.latitude ?? 37.5642135)
        self.longtitude = String(coor?.longitude ?? 127.0016985)
    }
}
