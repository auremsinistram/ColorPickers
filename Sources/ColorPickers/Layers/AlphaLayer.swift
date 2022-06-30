//
// AlphaLayer.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

import Extensions

class AlphaLayer: CAGradientLayer, Colored {
    
    // MARK: - Colored
    
    var color: Color {
        get {
            if let color = colors?.last {
#if os(iOS)
                return Color(cgColor: color as! CGColor)
#endif
#if os(macOS)
                return Color(cgColor: color as! CGColor) ?? .clear
#endif
            }
            return .clear
        }
        set {
            colors = [
                newValue.withAlphaComponent(0.0).cgColor,
                newValue.withAlphaComponent(1.0).cgColor
            ]
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
        let copy = layer as? AlphaLayer
        super.init(layer: layer)
        self.color = copy?.color ?? .clear
        setup()
    }
    
    // MARK: - Private func
    
    private func setup() {
        startPoint = .minXminY
        endPoint = .maxXminY
    }
}
