//
//  File.swift
//  
//
//  Created by Matt Pfeiffer on 7/8/22.
//

import Foundation

public extension Int {
    func wrapAround(to limits: ClosedRange<Self>) -> Self {
        var newValue = self
        
        while newValue < limits.lowerBound {
            newValue += limits.count
        }
        
        while newValue > limits.upperBound {
            newValue -= limits.count
        }

        return newValue
    }
}
