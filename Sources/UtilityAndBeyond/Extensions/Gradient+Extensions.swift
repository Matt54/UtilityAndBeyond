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
    
    static var coolRadialShine: Gradient {
        Gradient(colors: [
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.075),
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.025),
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0125),
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.05),
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0125),
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.025),
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.075),
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.05)
        ])
    }
    
    static var coolLinearShine: Gradient {
        Gradient(colors: [
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1),
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.01),
        ])
    }
    
//    static var radialGradient: Gradient {
//        var colors = [Color]()
//        
//        let baseOpacity = 0.075
//        let opacityOptions = [baseOpacity, baseOpacity * 0.75, baseOpacity * (2.0/3.0), baseOpacity * 0.5, baseOpacity / 3.0, baseOpacity * 0.25, baseOpacity / 6.0]
//        
//        for index in 0...7 {
//            let opacity = opacityOptions[index % opacityOptions.count-1]
//            colors.append(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: opacity))
//        }
//        return Gradient(colors: colors)
//    }
    
}
