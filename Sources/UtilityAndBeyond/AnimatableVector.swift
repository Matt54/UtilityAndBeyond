//
//  AnimatableVector.swift
//  
//
//  Created by Matt Pfeiffer on 8/3/22.
//

import SwiftUI

// MARK: AnimatableVector
public struct AnimatableVector: VectorArithmetic {
    
    public var values: [Double] // vector values
    
    public init(count: Int = 1) {
        self.values = [Double](repeating: 0.0, count: count)
        self.magnitudeSquared = 0.0
    }
    
    public init(with values: [Double]) {
        self.values = values
        self.magnitudeSquared = 0
        self.recomputeMagnitude()
    }
    
    func computeMagnitude()->Double {
        // compute square magnitued of the vector
        // = sum of all squared values
        var sum: Double = 0.0
        
        for index in 0..<self.values.count {
            sum += self.values[index]*self.values[index]
        }
        
        return Double(sum)
    }
    
    mutating func recomputeMagnitude(){
        self.magnitudeSquared = self.computeMagnitude()
    }
    
    // MARK: VectorArithmetic
    public var magnitudeSquared: Double // squared magnitude of the vector
    
    public mutating func scale(by rhs: Double) {
        // scale vector with a scalar
        // = each value is multiplied by rhs
        for index in 0..<values.count {
            values[index] *= rhs
        }
        self.magnitudeSquared = self.computeMagnitude()
    }
    
    // MARK: AdditiveArithmetic
    
    // zero is identity element for aditions
    // = all values are zero
    public static var zero: AnimatableVector = AnimatableVector()
    
    public static func + (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        var retValues = [Double]()
        
        for index in 0..<min(lhs.values.count, rhs.values.count) {
            retValues.append(lhs.values[index] + rhs.values[index])
        }
        
        return AnimatableVector(with: retValues)
    }
    
    public static func += (lhs: inout AnimatableVector, rhs: AnimatableVector) {
        for index in 0..<min(lhs.values.count,rhs.values.count)  {
            lhs.values[index] += rhs.values[index]
        }
        lhs.recomputeMagnitude()
    }

    public static func - (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
        var retValues = [Double]()
        
        for index in 0..<min(lhs.values.count, rhs.values.count) {
            retValues.append(lhs.values[index] - rhs.values[index])
        }
        
        return AnimatableVector(with: retValues)
    }
    
    public static func -= (lhs: inout AnimatableVector, rhs: AnimatableVector) {
        for index in 0..<min(lhs.values.count,rhs.values.count)  {
            lhs.values[index] -= rhs.values[index]
        }
        lhs.recomputeMagnitude()
    }
}
