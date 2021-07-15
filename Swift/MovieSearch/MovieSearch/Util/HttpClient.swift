////
////  HttpClient.swift
////  MovieSearch
////
////  Created by 박연배 on 2021/07/15.
////
//
import Foundation
import SwiftUI

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HttpClient {
    func getMoviesBy(queryValue: String, completion: @escaping (Result<[MovieInfo]?, NetworkError>) -> Void) {
        if let url = URL.fetchUrl(queryValue)  {
            var requestUrl = URLRequest(url: url)
            requestUrl.addValue("plain/text", forHTTPHeaderField: "Content-Type")
            requestUrl.addValue(Constants.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
            requestUrl.addValue(Constants.clientKEY, forHTTPHeaderField: "X-Naver-Client-Secret")
            
            
            URLSession.shared.dataTask(with: requestUrl) {data, response, error in
                
                guard let data = data, error == nil else {
                    print("DEBUG: noData")
                    return completion(.failure(.noData))
                }
                
                guard let MovieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                    print("DEBUG: decodingError")
                    return completion(.failure(.decodingError))
                }
                
                completion(.success(MovieResponse.movies))
            }.resume()
        }
        else {
            print("DEBUG: BadURL")
            return completion(.failure(.badURL))
        }
        
    }
}
