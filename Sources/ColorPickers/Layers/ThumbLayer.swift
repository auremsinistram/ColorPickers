//
// ThumbLayer.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

class ThumbLayer: CALayer, Colored {
    
    // MARK: - Private var
    
    private var ellipseLayer = EllipseLayer()
    
    private var strokeLayer = StrokeLayer()
    
    // MARK: - Colored
    
    var color: Color {
        get {
            return ellipseLayer.color
        }
        set {
            ellipseLayer.color = newValue
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
        let copy = layer as? ThumbLayer
        self.ellipseLayer = copy?.ellipseLayer ?? EllipseLayer()
        self.strokeLayer = copy?.strokeLayer ?? StrokeLayer()
        super.init(layer: layer)
        self.color = copy?.color ?? .clear
        setup()
    }
    
    // MARK: - Internal override func
    
    override func layoutSublayers() {
        super.layoutSublayers()
        ellipseLayer.frame = bounds
        strokeLayer.frame = bounds
    }
    
    // MARK: - Private func
    
    private func setup() {
        addSublayer(ellipseLayer)
        addSublayer(strokeLayer)
    }
}
