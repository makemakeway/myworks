//
//  ImageLoader.swift
//  MovieSearch
//
//  Created by 박연배 on 2021/07/14.
//

import Foundation


class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
            
            
            
        }.resume()
        
    }
    
}
