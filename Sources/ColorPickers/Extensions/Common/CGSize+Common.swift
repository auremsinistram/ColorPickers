//
// CGSize+Common.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

extension CGSize {
    
    // MARK: - Internal static var
    
    static var one: CGSize {
        return CGSize(
            width: 1.0,
            height: 1.0
        )
    }
}
