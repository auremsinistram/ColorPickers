//
// EllipseLayer.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

class EllipseLayer: CAShapeLayer, Colored {
    
    // MARK: - Colored
    
    var color: Color {
        get {
            if let fillColor = fillColor {
#if os(iOS)
                return Color(cgColor: fillColor)
#endif
#if os(macOS)
                return Color(cgColor: fillColor) ?? .clear
#endif
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
