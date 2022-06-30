//
// HSVColorPicker.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

import Extensions
import Square
import Colors

open class HSVColorPicker: ColorPicker, Colored {
    
    // MARK: - Open override var
    
    open override var preferredTrackLayers: [CALayer] {
        return [
            hsvLayer
        ]
    }
    
    // MARK: - Private lazy var
    
    private lazy var hsvLayer: HSVLayer = {
        let result = HSVLayer()
        result.color = .white
        result.setCornerRadius(2.0)
        return result
    }()
    
    // MARK: - Colored
    
    open var color: Color {
        get {
            return hsvLayer.color
        }
        set {
            hsvLayer.color = newValue
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
        var hsv = color.rgb.hsv
        hsv.s = Float(point.x)
        hsv.v = Float(1.0 - point.y)
        CALayer.performWithoutAnimation {
            thumbLayer.color = hsv.rgb.color
        }
    }
}
