//
// PatternLayer.swift
//

import UIKit
import Extensions

class PatternLayer: CAShapeLayer {
    
    // MARK: - Internal var
    
    var size = CGSize.one {
        didSet {
            setNeedsLayout()
        }
    }
    
    var colorA: UIColor {
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
    
    var colorB: UIColor {
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
        let copy = layer as? PatternLayer
        self.size = copy?.size ?? .one
        super.init(layer: layer)
        self.colorA = copy?.colorA ?? .clear
        self.colorB = copy?.colorB ?? .clear
        setup()
    }
    
    // MARK: - Internal override func
    
    override func layoutSublayers() {
        super.layoutSublayers()
        let frameSize = frame.size
        let width = size.width
        let height = size.height
        let m = Int((frameSize.width / width).rounded(.up))
        let n = Int((frameSize.height / height).rounded(.up))
        let path = CGMutablePath()
        var isY = true
        for y in 0..<n {
            var isX = isY
            for x in 0..<m {
                if isX {
                    let rect = CGRect(
                        x: CGFloat(x) * width,
                        y: CGFloat(y) * height,
                        width: width,
                        height: height
                    )
                    path.addRect(rect)
                }
                isX = !isX
            }
            isY = !isY
        }
        self.path = path
    }
    
    // MARK: - Private func
    
    private func setup() {
        masksToBounds = true
    }
}
