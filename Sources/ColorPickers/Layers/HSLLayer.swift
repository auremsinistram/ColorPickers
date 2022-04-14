//
// HSLLayer.swift
//

import UIKit
import Extensions

class HSLLayer: CALayer, Colored {
    
    // MARK: - Private var
    
    private var colorLayer = CAGradientLayer()
    private var whiteLayer = CAGradientLayer()
    private var blackLayer = CAGradientLayer()
    
    // MARK: - Colored
    
    var color: UIColor {
        get {
            if let color = colorLayer.colors?.last {
                return UIColor(cgColor: color as! CGColor)
            }
            return .clear
        }
        set {
            colorLayer.colors = [
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
        let copy = layer as? HSLLayer
        self.colorLayer = copy?.colorLayer ?? CAGradientLayer()
        self.whiteLayer = copy?.whiteLayer ?? CAGradientLayer()
        self.blackLayer = copy?.blackLayer ?? CAGradientLayer()
        super.init(layer: layer)
        setup()
    }
    
    // MARK: - Internal override func
    
    override func layoutSublayers() {
        super.layoutSublayers()
        let width = bounds.width
        let height = 0.5 * bounds.height
        colorLayer.frame = bounds
        whiteLayer.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: width,
            height: height
        )
        blackLayer.frame = CGRect(
            x: 0.0,
            y: height,
            width: width,
            height: height
        )
    }
    
    // MARK: - Private func
    
    private func setup() {
        let white = UIColor.white
        let black = UIColor.black
        backgroundColor = UIColor.gray.cgColor
        colorLayer.startPoint = .minXminY
        colorLayer.endPoint = .maxXminY
        whiteLayer.startPoint = .minXminY
        whiteLayer.endPoint = .minXmaxY
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
        addSublayer(colorLayer)
        addSublayer(whiteLayer)
        addSublayer(blackLayer)
    }
}
