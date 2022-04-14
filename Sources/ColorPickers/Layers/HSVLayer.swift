//
// HSVLayer.swift
//

import UIKit
import Extensions

class HSVLayer: CALayer, Colored {
    
    // MARK: - Private var
    
    private var whiteLayer = CAGradientLayer()
    private var blackLayer = CAGradientLayer()
    
    // MARK: - Colored
    
    var color: UIColor {
        get {
            if let backgroundColor = backgroundColor {
                return UIColor(cgColor: backgroundColor)
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
        let white = UIColor.white
        let black = UIColor.black
        whiteLayer.startPoint = .minXminY
        whiteLayer.endPoint = .maxXminY
        whiteLayer.colors = [
            white.withAlphaComponent(1.0).cgColor,
            white.withAlphaComponent(0.0).cgColor
        ]
        blackLayer.startPoint = .minXminY
        blackLayer.endPoint = .minXmaxY
        blackLayer.colors = [
            black.withAlphaComponent(0.0).cgColor,
            black.withAlphaComponent(1.0).cgColor
        ]
        addSublayer(whiteLayer)
        addSublayer(blackLayer)
    }
}
