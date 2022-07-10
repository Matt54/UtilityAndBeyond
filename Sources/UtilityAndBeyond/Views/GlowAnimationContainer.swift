import SwiftUI

public struct GlowAnimationContainer<Content>: View where Content: View {
    var content: () -> Content
    @State private var animating: Bool = false
    let showAnimation: Bool

    public init(showAnimation: Bool = true, content: @escaping () -> Content) {
        self.showAnimation = showAnimation
        self.content = content
    }

    public var body: some View {
        content()
            .overlay(
                ZStack {
                    if showAnimation {
                        Color.white
                            .opacity(animating ? 0.3 : 0)
                            .mask(content())
                            .allowsHitTesting(false)
                            .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animating)
                            .onAppear { animating = true }
                            .onDisappear { animating = false }
                    }
                }
            )
    }
}

struct GlowPreviewView: View {
    var body: some View {
        GlowAnimationContainer {
            Rectangle()
                .fill(Color.yellow)
        }
    }
}

struct GlowView_Previews: PreviewProvider {
    static var previews: some View {
        GlowPreviewView()
    }
}
