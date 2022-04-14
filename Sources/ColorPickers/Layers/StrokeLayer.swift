//
// StrokeLayer.swift
//

import UIKit

class StrokeLayer: EllipseLayer {
    
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
        super.init(layer: layer)
        setup()
    }
    
    // MARK: - Internal override func
    
    override func layoutSublayers() {
        super.layoutSublayers()
        let mainSize: CGFloat = 12.0
        let mainLineWidth: CGFloat = 2.0
        let mainShadowRadius: CGFloat = 1.0
        let size = min(bounds.width, bounds.height)
        let ratio = size / mainSize
        lineWidth = ratio * mainLineWidth
        shadowRadius = ratio * mainShadowRadius
    }
    
    // MARK: - Private func
    
    private func setup() {
        strokeColor = UIColor.white.cgColor
        shadowColor = UIColor.black.cgColor
        shadowOffset = .zero
        shadowOpacity = 0.8
    }
}
