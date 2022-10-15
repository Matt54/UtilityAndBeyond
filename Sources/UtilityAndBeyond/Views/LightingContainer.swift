//
//  LightingContainer.swift
//  
//
//  Created by Matt Pfeiffer on 9/28/22.
//

import SwiftUI

public struct RadialLightingContainer<Content>: View where Content: View {
    var content: () -> Content
    
    public init(content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        GeometryReader { geo in
            content()
                .shadow(color: .black.opacity(0.075),
                        radius: geo.size.width * 0.01,
                        x: -geo.size.width * 0.02,
                        y: geo.size.height * 0.04)
                .overlay(
                    AngularGradient(gradient: Gradient.coolRadialShine,
                                    center: .center)
                        .mask(content())
                        .allowsHitTesting(false)
                )
        }
    }
}

struct RadialLightingContainer_Previews: PreviewProvider {
    static var previews: some View {
        RadialLightingContainer{
            Rectangle().fill(.black)
        }
    }
}

public struct LinearLightingContainer<Content>: View where Content: View {
    var content: () -> Content
    
    public init(content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        GeometryReader { geo in
            content()
                .shadow(color: .black.opacity(0.075),
                        radius: geo.size.width * 0.01,
                        x: -geo.size.width * 0.02,
                        y: geo.size.height * 0.04)
                .overlay(
                    LinearGradient(gradient: Gradient.coolLinearShine,
                                   startPoint: .topTrailing,
                                   endPoint: .bottomLeading)
                        .mask(content())
                        .allowsHitTesting(false)
                )
        }
    }
}

struct LinearLightingContainer_Previews: PreviewProvider {
    static var previews: some View {
        LinearLightingContainer{
            Rectangle().fill(.black)
        }
    }
}
