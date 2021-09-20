//
//  CornerRadiusView.swift
//  Carrot
//
//  Created by 박연배 on 2021/09/09.
//

import UIKit


class CornerRadiusView: UIView {
    // IBInspectable = 인스펙터 패널에서 사용할 수 있도록 설정
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
