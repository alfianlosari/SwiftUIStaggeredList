import XCTest
@testable import StaggeredList

final class StaggeredListTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(StaggeredList().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
