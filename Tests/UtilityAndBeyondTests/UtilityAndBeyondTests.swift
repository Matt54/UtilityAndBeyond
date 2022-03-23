import XCTest
@testable import UtilityAndBeyond

class UtilityAndBeyondTests: XCTestCase {
    func testClampUpperBound() throws {
        let initialValue = 1.1
        XCTAssertEqual(initialValue.clamped(to: 0...1), 1.0)
    }
    func testClampLowerBound() throws {
        let initialValue = -0.5
        XCTAssertEqual(initialValue.clamped(to: 0...1), 0.0)
    }
    func testMap() throws {
        let initialValue: CGFloat = 100.0
        XCTAssertEqual(initialValue.mapped(from: 0...100, to: 0...1), 1.0)
    }
    func testLog10Map() throws {
        let initialValue: CGFloat = 50.0
        XCTAssertEqual(initialValue.mappedLog10(from: 1...100, to: 1...100), 85.09901521463293)
    }
    func testExpMap() throws {
        let initialValue: CGFloat = 50.0
        XCTAssertEqual(initialValue.mappedExp(from: 1...100, to: 1...100), 9.770099572992253)
    }
}
