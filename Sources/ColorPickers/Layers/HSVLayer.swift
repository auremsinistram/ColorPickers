//
// HSVLayer.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

import Extensions

class HSVLayer: CALayer, Colored {
    
    // MARK: - Private var
    
    private var whiteLayer = CAGradientLayer()
    private var blackLayer = CAGradientLayer()
    
    // MARK: - Colored
    
    var color: Color {
        get {
            if let backgroundColor = backgroundColor {
#if os(iOS)
                return Color(cgColor: backgroundColor)
#endif
#if os(macOS)
                return Color(cgColor: backgroundColor) ?? .clear
#endif
            }
            return .clear
        }
        set {
            backgroundColor = newValue.cgColor
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
        let copy = layer as? HSVLayer
        self.whiteLayer = copy?.whiteLayer ?? CAGradientLayer()
        self.blackLayer = copy?.blackLayer ?? CAGradientLayer()
        super.init(layer: layer)
        self.color = copy?.color ?? .clear
        setup()
    }
    
    // MARK: - Internal override func
    
    override func layoutSublayers() {
        super.layoutSublayers()
        whiteLayer.frame = bounds
        blackLayer.frame = bounds
    }
    
    // MARK: - Private func
    
    private func setup() {
        let white = Color.white
        let black = Color.black
        whiteLayer.startPoint = .minXminY
        whiteLayer.endPoint = .maxXminY
        whiteLayer.colors = [
            white.withAlphaComponent(1.0).cgColor,
            white.withAlphaComponent(0.0).cgColor
        ]
#if os(iOS)
        blackLayer.startPoint = .minXminY
        blackLayer.endPoint = .minXmaxY
#endif
#if os(macOS)
        blackLayer.startPoint = .minXmaxY
        blackLayer.endPoint = .minXminY
#endif
        blackLayer.colors = [
            black.withAlphaComponent(0.0).cgColor,
            black.withAlphaComponent(1.0).cgColor
        ]
        addSublayer(whiteLayer)
        addSublayer(blackLayer)
    }
}
