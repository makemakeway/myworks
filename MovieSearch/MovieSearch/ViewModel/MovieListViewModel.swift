//
//  MovieListViewModel.swift
//  MovieSearch
//
//  Created by 박연배 on 2021/07/15.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    @Published var movies = [MovieViewModel]()
    
    let httpClient = HttpClient()
    
    func searchByName(_ name: String) {
        httpClient.getMoviesBy(queryValue: name) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        
                        self.movies = movies.map(MovieViewModel.init)
                    }
                }
            case .failure(let error):
                print("DEBUG: " + error.localizedDescription)
            }
        }
    }
    
}


struct MovieViewModel {
    let movie: MovieInfo
    
    var title: String {
        movie.title
    }
    var link: String {
        movie.link
    }
    var imageURL: String {
        movie.imageURL
    }
    var pubDate: String {
        movie.pubDate
    }
    var director: String {
        movie.director
    }
    var actors: String {
        movie.actors
    }
    var userRating: String {
        movie.userRating
    }
}
