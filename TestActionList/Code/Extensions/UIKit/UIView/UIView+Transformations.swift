//
//  UIView+Transformations.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import Foundation
import UIKit

protocol CornerProtocol: class {
    
    var corners: UIRectCorner { get set }
    var radius: CGFloat { get set }
    var maskLayer: CALayer { get set }
    
    var bounds: CGRect { get set }
    var layer: CALayer { get }
    
    func sizeToFit()
    
    func transformCorners()
    
}

extension CornerProtocol {
    
    func transformCorners() {
        let mask = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = mask.cgPath
        layer.mask = maskLayer
    }
    
}

// MARK: - CornerView

class CornerView: UIView, CornerProtocol {
   
    var corners: UIRectCorner = []
    
    var radius: CGFloat = 8
    
    var maskLayer: CALayer = CALayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        maskLayer.frame = bounds
        transformCorners()
    }
    
}
