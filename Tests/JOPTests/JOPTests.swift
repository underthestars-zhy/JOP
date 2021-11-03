import XCTest
@testable import JOP

final class JOPTests: XCTestCase {
    func testHelloWorld() throws {
        let run: [String : Any] = [
            "main" : [
                [
                    "command": "define",
                    "name": "test",
                    "type": "String"
                ],
                [
                    "command": "assignment",
                    "name": "test",
                    "value": "hello, world!"
                ],
                [
                    "command": "call",
                    "type": "func",
                    "name": "print"
                ]
            ]
        ]
        
        JOP.run(run, filePath: URL(fileURLWithPath: "")) { error in
            print(error)
        }?
            .start()
    }
}
