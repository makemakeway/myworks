//
//  UrlExtension.swift
//  MovieSearch
//
//  Created by 박연배 on 2021/07/15.
//

import Foundation
import SwiftUI

extension URL {
    static func fetchUrl(_ queryValue: String) -> URL? {
        let query = "https://openapi.naver.com/v1/search/movie.json?query=\(queryValue)&display=100"
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else { return nil }
        let queryUrl = URL(string: encodedQuery)
        return queryUrl
    }
}
