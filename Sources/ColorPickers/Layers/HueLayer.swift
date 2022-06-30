//
// HueLayer.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

import Extensions

class HueLayer: CAGradientLayer {
    
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
    
    // MARK: - Private func
    
    private func setup() {
        startPoint = .minXminY
        endPoint = .maxXminY
        var colors = [CGColor]()
        for i in 0...100 {
            let color = Color(
                hue: 0.01 * CGFloat(i),
                saturation: 1.0,
                brightness: 1.0,
                alpha: 1.0
            )
            colors.append(color.cgColor)
        }
        self.colors = colors
    }
}
