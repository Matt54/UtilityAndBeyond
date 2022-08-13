//
//  View+NewWindow.swift
//  
//
//  Created by Matt Pfeiffer on 8/13/22.
//

import SwiftUI

#if os(OSX)
public extension View {
    private func newWindowInternal(title: String, geometry: NSRect, style: NSWindow.StyleMask, delegate: NSWindowDelegate, windowEscape: ((NSWindow) -> Void)? = nil) -> NSWindow {
        let window = NSWindow(
            contentRect: geometry,
            styleMask: style,
            backing: .buffered,
            defer: false
        )
        window.center()
        window.isReleasedWhenClosed = false
        window.title = title
        window.makeKeyAndOrderFront(nil)
        window.delegate = delegate
        window.orderFrontRegardless()
        
        if let action = windowEscape {
            action(window)
        }
        
        return window
    }
   
    func openNewWindow(title: String, delegate: NSWindowDelegate, geometry: NSRect = NSRect(x: 20, y: 20, width: 640, height: 480), style: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable], windowEscape: ((NSWindow) -> Void)? = nil) {
        newWindowInternal(title: title, geometry: geometry, style: style, delegate: delegate, windowEscape: windowEscape).contentView = NSHostingView(rootView: self)
    }
}
#endif
