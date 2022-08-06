//
//  NSCursor+Extensions.swift
//  
//
//  Created by Matt Pfeiffer on 8/2/22.
//

import SwiftUI

public extension NSCursor {
    static func handleButtonHoverChange(isHovering: Bool) {
        isHovering ? pointingHand.push() : pop()
    }
    
    static func handleDraggableHoverChange(isHovering: Bool) {
        isHovering ? dragLink.push() : pop()
    }
}
