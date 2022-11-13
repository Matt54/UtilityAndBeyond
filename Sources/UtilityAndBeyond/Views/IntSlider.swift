//
//  SwiftUIView.swift
//  
//
//  Created by Matt Pfeiffer on 11/7/22.
//

import SwiftUI

public struct IntSlider: View {
    @Binding var value: Int
    var range: ClosedRange<Double>
    
    public init(value: Binding<Int>, range: ClosedRange<Int>) {
        _value = value
        self.range = Double(range.lowerBound)...Double(range.upperBound)
    }
    
    var intProxy: Binding<Double> {
        Binding<Double>(get: { Double(value) }, set: { value = Int($0) })
    }
    
    public var body: some View {
        Slider(value: intProxy, in: range, step: 1.0)
    }
}

struct IntSliderPreviewView: View {
    @State var value: Int = 0
    let range: ClosedRange<Int> = 0...10
    
    var body: some View {
        IntSlider(value: $value, range: range)
    }
}

struct IntSlider_Previews: PreviewProvider {
    static var previews: some View {
        IntSliderPreviewView()
    }
}
