//
//  UrlExtension.swift
//  LocalSNSApp
//
//  Created by 박연배 on 2021/08/17.
//

import SwiftUI

extension URL {
    static func fetchUrl(_ latitude: String, _ longtitude: String) -> URL? {
        let query = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x=\(longtitude)&y=\(latitude)&input_coord=WGS84"
        let queryUrl = URL(string: query)
        return queryUrl
    }
}
