//
// HSLColorPicker.swift
//

import UIKit
import Extensions
import Square
import Colors

open class HSLColorPicker: ColorPicker, Colored {
    
    // MARK: - Open override var
    
    open override var preferredTrackLayers: [CALayer] {
        return [
            hslLayer
        ]
    }
    
    // MARK: - Private lazy var
    
    private lazy var hslLayer: HSLLayer = {
        let result = HSLLayer()
        result.color = .white
        result.setCornerRadius(2.0)
        return result
    }()
    
    // MARK: - Colored
    
    open var color: UIColor {
        get {
            return hslLayer.color
        }
        set {
            hslLayer.color = newValue
            update()
        }
    }
    
    // MARK: - Open override func
    
    open override func update(with point: CGPoint) {
        super.update(with: point)
        update()
    }
    
    // MARK: - Private func
    
    private func update() {
        var hsl = color.rgb.hsl
        hsl.s = Float(point.x)
        hsl.l = Float(1.0 - point.y)
        CALayer.performWithoutAnimation {
            thumbLayer.color = hsl.rgb.color
        }
    }
}
