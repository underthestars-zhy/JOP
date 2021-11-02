import XCTest
@testable import JOP

final class JOPTests: XCTestCase {
    func testExample() throws {
        let run: [String : Any] = [
            "main" : [
                [
                    "command": "define"
                ]
            ]
        ]
        
        JOP.run(run, filePath: URL(fileURLWithPath: "")) { error in
            print(error)
        }?
            .start()
    }   
}
