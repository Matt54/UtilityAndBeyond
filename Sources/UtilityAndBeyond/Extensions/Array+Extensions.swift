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
}
