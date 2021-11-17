# JOP

JOP is a program **organized in JSON** files.
It is **based on Swift**, provides a *syntax similar* to Swift, and has the *same strong security* as Swift.
This project only provides **JOP running call interface**, you need to **call it in Swift**.
JOP is still undergoing *rapid development*, and destructive changes will be more obvious.

## Run

> The following code needs to be called in Swift.

```swift
public static func run(_ text: String, filePath: URL, errorHandle: ((Error) -> Void)? = nil) -> Processer?
public static func run(_ dict: [String : Any], filePath: URL, errorHandle: ((Error) -> Void)? = nil) -> Processer?
```

* `text`: JSON file to be parsed
* `dict`: Dict to be parsed
* `filePath`: The path of the program at startup
* `errorHandle`: Called when the program encounters an error

`JOP.run` supports calling through a dictionary(`[String : Any]`), or through a `JSON string`.
`JOP.run` return a `Processer`.

Use `start()` to start the processer

```swift
JOP.run("", filePath: URL(fileURLWithPath: "")) { error in
    print(error)
}?
.start()
```

`start()` will use the `Runner` internally to start itself.

### Callback

The callback function acts on the `Processor`!

#### OnPrint

Callback function triggered when the program calls `print()`

```swift
JOP.run(run, filePath: URL(fileURLWithPath: "")) { error in
    print(error)
}?
.onOutPut{ outPut in
    print(outPut.text)
}
.start()
```

output is a type instance of `OutPut`.

`OutPut` stores the **text, text color, bold** and other information.

```swift
public struct OutPut {
    var color: String?
    var bold: Bool
    var text: String
}
```

## Example

```swift
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
            "command": "assignment",
            "name": "theFirstValue",
            "value": "hello, JOP!"
        ],
        [
            "command": "call",
            "type": "func",
            "name": "print",
            "passBy": "$theFirstValue"
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
```

Ouput:

```bash
hello, world!
hello, JOP!
```
