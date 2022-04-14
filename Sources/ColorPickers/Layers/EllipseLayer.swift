//
// EllipseLayer.swift
//

import UIKit

class EllipseLayer: CAShapeLayer, Colored {
    
    // MARK: - Colored
    
    var color: UIColor {
        get {
            if let fillColor = fillColor {
                return UIColor(cgColor: fillColor)
            }
            return .clear
        }
        set {
            fillColor = newValue.cgColor
        }
    }
    
    // MARK: - Internal override init
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(layer: Any) {
        let copy = layer as? EllipseLayer
        super.init(layer: layer)
        self.color = copy?.color ?? .clear
        setup()
    }
    
    // MARK: - Internal override func
    
    override func layoutSublayers() {
        super.layoutSublayers()
        path = CGPath(
            ellipseIn: bounds,
            transform: nil
        )
    }
    
    // MARK: - Private func
    
    private func setup() {
        color = .clear
    }
}
