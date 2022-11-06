//
//  WindowAccessor.swift
//  
//
//  Created by Matt Pfeiffer on 11/6/22.
//

import SwiftUI

#if os(OSX)
/// Allows for SwiftUI to attain a reference to an underlying NSWindow
///
/// .background(WindowAccessor(window: $window))
public struct WindowAccessor: NSViewRepresentable {
    @Binding var window: NSWindow?
    
    public init(window: Binding<NSWindow?>) {
        self._window = window
    }
    
    public func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            self.window = view.window
        }
        return view
    }
    
    public func updateNSView(_ nsView: NSView, context: Context) {}
}
#endif
