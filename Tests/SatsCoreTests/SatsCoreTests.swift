import XCTest
@testable import SatsCore

final class SatsCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SatsCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
