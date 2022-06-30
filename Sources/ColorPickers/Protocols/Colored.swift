//
// Colored.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

public protocol Colored {
    
    var color: Color { get set }
}
