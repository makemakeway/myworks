//
//  ItemCellView.swift
//  Practice
//
//  Created by 박연배 on 2021/09/07.
//

import Foundation
import UIKit

// 인터페이스 빌더에서 확인 가능하게끔 해주는 IBDesignable
@IBDesignable
class ItemCellView: UIView {
    // IBInspectable = 인스펙터 패널에서 사용할 수 있도록 설정
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
