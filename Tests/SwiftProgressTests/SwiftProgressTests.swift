import XCTest
@testable import SwiftProgress

final class SwiftProgressTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftProgress().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
