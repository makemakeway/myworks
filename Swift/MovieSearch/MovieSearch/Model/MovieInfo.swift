//
//  MovieInfo.swift
//  MovieSearch
//
//  Created by 박연배 on 2021/07/13.
//

import Foundation


struct MovieResponse: Codable {
    let movies: [MovieInfo]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "items"
    }
}


struct MovieInfo: Codable {
    let title: String
    let link: String
    let imageURL: String
    let pubDate: String
    let director: String
    let actors: String
    let userRating: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case link = "link"
        case imageURL = "image"
        case pubDate = "pubDate"
        case director = "director"
        case actors = "actor"
        case userRating = "userRating"
    }
}
