//
//  Extensions.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
