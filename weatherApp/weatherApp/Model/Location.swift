//
//  Location.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/22.
//

import Foundation

struct LocationResponse: Codable {
    let documents: [AddressType]
    
    private enum CodingKeys: String, CodingKey {
        case documents = "documents"
    }
}

struct AddressType: Codable {
    let address: Address
    
    private enum CodingKeys: String, CodingKey {
        case address = "address"
    }
}

struct Address: Codable {
    let depthOne: String
    let depthTwo: String
    let depthThree: String
    
    private enum CodingKeys: String, CodingKey {
        case depthOne = "region_1depth_name"
        case depthTwo = "region_2depth_name"
        case depthThree = "region_3depth_name"
    }
}
