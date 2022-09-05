import SwiftUI

// MARK: View+NewWindow
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

//https://www.avanderlee.com/swiftui/withanimation-completion-callback/
public extension View {

    /// Calls the completion handler whenever an animation on the given value completes.
    /// - Parameters:
    ///   - value: The value to observe for animations.
    ///   - completion: The completion callback to call once the animation completes.
    /// - Returns: A modified `View` instance with the observer attached.
    func onAnimationCompleted<Value: VectorArithmetic>(for value: Value, completion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        return modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
    }
}

/// An animatable modifier that is used for observing animations for a given animatable value.
public struct AnimationCompletionObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {

    /// While animating, SwiftUI changes the old input value to the new target value using this property. This value is set to the old value until the animation completes.
    public var animatableData: Value {
        didSet {
            notifyCompletionIfFinished()
        }
    }

    /// The target value for which we're observing. This value is directly set once the animation starts. During animation, `animatableData` will hold the oldValue and is only updated to the target value once the animation completes.
    private var targetValue: Value

    /// The completion callback which is called once the animation completes.
    private var completion: () -> Void

    public init(observedValue: Value, completion: @escaping () -> Void) {
        self.completion = completion
        self.animatableData = observedValue
        targetValue = observedValue
    }

    /// Verifies whether the current animation is finished and calls the completion callback if true.
    private func notifyCompletionIfFinished() {
        guard animatableData == targetValue else { return }

        /// Dispatching is needed to take the next runloop for the completion callback.
        /// This prevents errors like "Modifying state during view update, this will cause undefined behavior."
        DispatchQueue.main.async {
            self.completion()
        }
    }

    public func body(content: Content) -> some View {
        /// We're not really modifying the view so we can directly return the original input value.
        return content
    }
}


