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
}
