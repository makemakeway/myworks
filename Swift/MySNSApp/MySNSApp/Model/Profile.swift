//
//  Profile.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/27.
//

import Foundation
import SwiftUI

struct Profile: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var userName: String
    var profileMessage: String
    var profileImage: UIImage
}
