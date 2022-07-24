import Foundation

public extension Array {
    /// Returns new array by adding first element then swapping every other additional element.
    ///
    /// Example:
    /// input: [0,1,2,3,4,5,6]
    /// output: [0,2,1,4,3,6,5]
    func skipShuffle() -> Array {
        var skipElements = [Element]()
        
        // count is 3 -> hits all the intervals [0, 2, 1]
        // count is 4 -> misses the last [0, 2, 1] (no 3)
        for i in stride(from: 0, to: self.count, by: 2) {
            skipElements.append(self[i])
            if i-1 > 0 {
                skipElements.append(self[i-1])
            }
        }
        
        // add the last element if needed
        if self.count % 2 == 0 {
            skipElements.append(self[self.count-1])
        }
        
        return skipElements
    }
    
    /// Returns new array by adding first element then last element, then second element, then second last element, etc..
    ///
    /// Example:
    /// input: [0,1,2,3,4,5]
    /// output: [0,5,1,4,2,3]
    func convergeShuffle() -> Array {
        var convergeElements = [Element]()
        let halfCount = self.count/2
        
        // count is 5 -> half count is 2 -> missed middle [0, 4, 1, 3] (no 2)
        // count is 6 -> half count is 3 -> hits all [0, 5, 1, 4, 2, 3]
        for i in 0..<halfCount {
            convergeElements.append(self[i])
            convergeElements.append(self[self.count-1-i])
        }
        
        // add the last element if needed
        if self.count % 2 != 0 {
            convergeElements.append(self[halfCount])
        }
        
        return convergeElements
    }
    
    /// Returns new array by adding middle element then one element below, then one element higher, etc...
    ///
    /// Example:
    /// input: [0,1,2,3,4,5]
    /// output: [3,2,4,1,5,0]
    func divergeShuffle() -> Array {
        var divergeElements = [Element]()
        let halfCount = self.count/2
        
        divergeElements.append(self[halfCount])
        
        // count is 5 -> half count is 2 -> hits all [2, 1, 3, 0, 4]
        // count is 6 -> half count is 3 -> hits all [3, 2, 4, 1, 5, 0]
        for i in 1...halfCount {
            if halfCount-i >= 0 {
                divergeElements.append(self[halfCount-i])
            }
            if halfCount+i < self.count {
                divergeElements.append(self[halfCount+i])
            }
        }
        
        return divergeElements
    }
}
