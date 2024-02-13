//
//  StatefulPreviewWrapper.swift
//
//
//  Created by Matt Pfeiffer on 2/13/24.
//

import SwiftUI

// Allows for conveniently test views with bindings for changes
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    let content: (Binding<Value>) -> Content

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: value)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
