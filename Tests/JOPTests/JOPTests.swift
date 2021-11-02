import XCTest
@testable import JOP

final class JOPTests: XCTestCase {
    func testExample() throws {
        JOP.run("", filePath: URL(fileURLWithPath: "")) { error in
            print(error)
        }?
            .start()
    }
}
