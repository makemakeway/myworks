//
//  CellInfo.swift
//  FaceBookMeSwiftUI
//
//  Created by 박연배 on 2021/06/15.
//

import SwiftUI

struct Cellinfo: Identifiable { // Identifiable -> 고유 식별자를 위한 프로토콜
    let id = UUID()
    let text: String
    let image: String
}
