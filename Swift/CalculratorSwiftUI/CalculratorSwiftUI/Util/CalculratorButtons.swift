//
//  CalculratorButtons.swift
//  CalculratorSwiftUI
//
//  Created by 박연배 on 2021/07/24.
//

import Foundation
import SwiftUI


enum CalButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case equal = "="
    case clear = "C"
    case abs = "+/-"
    case persentize = "%"
    case div = "/"
    case mul = "x"
    case sub = "-"
    case add = "+"
    case demical = "."
    
    var buttonColor: Color {
        switch self {
        case .clear, .persentize, .abs:
            return Color(.lightGray)
        case .div, .mul, .sub, .add, .equal:
            return Color(.orange)
        default:
            return Color(.darkGray)
        }
    }
    
}
