//
// AlphaColorPicker.swift
//

import UIKit
import Extensions
import Square

open class AlphaColorPicker: ColorPicker, Colored {
    
    // MARK: - Open override var
    
    open override var preferredAxis: Square.Axis {
        return .x
    }
    
    open override var preferredTrackLayers: [CALayer] {
        return [
            patternLayer,
            alphaLayer
        ]
    }
    
    // MARK: - Open var
    
    open var patternSize: CGSize {
        get {
            return patternLayer.size
        }
        set {
            patternLayer.size = newValue
        }
    }
    
    open var patternColorA: UIColor {
        get {
            return patternLayer.colorA
        }
        set {
            patternLayer.colorA = newValue
        }
    }
    
    open var patternColorB: UIColor {
        get {
            return patternLayer.colorB
        }
        set {
            patternLayer.colorB = newValue
        }
    }
    
    // MARK: - Private lazy var
    
    private lazy var patternLayer: PatternLayer = {
        let result = PatternLayer()
        result.size = CGSize(
            width: 10.0,
            height: 10.0
        )
        result.colorA = .gray
        result.colorB = .lightGray
        result.setCornerRadius(2.0)
        return result
    }()
    
    private lazy var alphaLayer: AlphaLayer = {
        let result = AlphaLayer()
        result.color = .white
        result.setCornerRadius(2.0)
        return result
    }()
    
    // MARK: - Colored
    
    open var color: UIColor {
        get {
            return alphaLayer.color
        }
        set {
            alphaLayer.color = newValue
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
        CALayer.performWithoutAnimation {
            thumbLayer.color = color.withAlphaComponent(value)
        }
    }
}
