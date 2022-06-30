//
// HueColorPicker.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

import Extensions
import Square

open class HueColorPicker: ColorPicker {
    
    // MARK: - Open override var
    
    open override var preferredAxis: Square.Axis {
        return .x
    }
    
    open override var preferredTrackLayers: [CALayer] {
        return [
            hueLayer
        ]
    }
    
    // MARK: - Private lazy var
    
    private lazy var hueLayer: HueLayer = {
        let result = HueLayer()
        result.setCornerRadius(2.0)
        return result
    }()
    
    // MARK: - Open override func
    
    open override func update(with point: CGPoint) {
        super.update(with: point)
        CALayer.performWithoutAnimation {
            thumbLayer.color = Color(
                hue: value,
                saturation: 1.0,
                brightness: 1.0,
                alpha: 1.0
            )
        }
    }
}
