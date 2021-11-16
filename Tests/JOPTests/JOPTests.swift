import XCTest
@testable import JOP

final class JOPTests: XCTestCase {
    func testHelloWorld() throws {
        let run: [String : Any] = [
            "main" : [
                [
                    "command": "define",
                    "name": "theFirstValue",
                    "type": "String"
                ],
                [
                    "command": "assignment",
                    "name": "theFirstValue",
                    "value": "hello, world!"
                ],
                [
                    "command": "call",
                    "type": "func",
                    "name": "print",
                    "passBy": "$theFirstValue"
                ],
                [
                    "command": "define",
                    "name": "theSecondValue",
                    "type": "String"
                ],
                [
                    "command": "assignment",
                    "name": "theSecondValue",
                    "value": "hello, JOP!"
                ],
                [
                    "command": "call",
                    "type": "func",
                    "name": "print",
                    "passBy": "$theSecondValue"
                ]
            ]
        ]
        
        JOP.run(run, filePath: URL(fileURLWithPath: "")) { error in
            print(error)
        }?
            .onOutPut{ outPut in
                print(outPut.text)
            }
            .start()
    }
}
