import SwiftUI

public struct HighlightAnimationContainer<Content>: View where Content: View {
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
                        AngularGradient(gradient: Gradient.shiny,
                                        center: .center,
                                        angle: Angle(degrees: animating ? 0 : 360))
                            .mask(content())
                            .allowsHitTesting(false)
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: animating)
                            .onAppear { animating = true }
                            .onDisappear { animating = false }
                    }
                }
            )
    }
}

struct HighlightPreviewView: View {
    var body: some View {
        HighlightAnimationContainer {
            Rectangle()
                .fill(Color.yellow)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightPreviewView()
    }
}
