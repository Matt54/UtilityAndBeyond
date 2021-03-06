import SwiftUI

public extension Gradient {
    static var shiny: Gradient {
        Gradient(colors: [
            Color.primary.invert().applyAlpha(0.2),
            Color.primary.invert().applyAlpha(0.25),
            Color.primary.invert().applyAlpha(0.5),
            Color.primary.invert().applyAlpha(0.5),
            Color.primary.invert().applyAlpha(0.25),
            Color.primary.invert().applyAlpha(0.25),
            Color.primary.invert().applyAlpha(0.75),
            Color.primary.invert().applyAlpha(0.175)
        ])
    }
    
    static var subtleShine: Gradient {
        Gradient(colors: [
            Color.primary.invert().applyAlpha(0.1),
            Color.primary.invert().applyAlpha(0.375),
            Color.primary.invert().applyAlpha(0.125),
            Color.primary.invert().applyAlpha(0.25),
            Color.primary.invert().applyAlpha(0.125),
            Color.primary.invert().applyAlpha(0.25),
            Color.primary.invert().applyAlpha(0.125),
            Color.primary.invert().applyAlpha(0.0625)
        ])
    }
}
