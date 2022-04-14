//
// ColorPicker.swift
//

import UIKit
import Square

open class ColorPicker: Square {
    
    // MARK: - Open override var
    
    open override var preferredAxis: Axis {
        return .all
    }
    
    open override var preferredThumbLayer: CALayer {
        return thumbLayer
    }
    
    open override var preferredEdgeInsets: UIEdgeInsets {
        let edgeInset: CGFloat = -8.0
        return UIEdgeInsets(
            top: edgeInset,
            left: edgeInset,
            bottom: edgeInset,
            right: edgeInset
        )
    }
    
    // MARK: - Open var
    
    open var thumbColor: UIColor {
        get {
            return thumbLayer.color
        }
        set {
            thumbLayer.color = newValue
        }
    }
    
    // MARK: - Internal lazy var
    
    lazy var thumbLayer: ThumbLayer = {
        let size: CGFloat = 12.0
        let result = ThumbLayer()
        result.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: size,
            height: size
        )
        return result
    }()
}
