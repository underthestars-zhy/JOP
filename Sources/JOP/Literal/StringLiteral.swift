//
//  File.swift
//  
//
//  Created by 朱浩宇 on 2021/11/15.
//

import Foundation
import SwiftyJSON

struct StringLiteral: LiteralProtocol {
    var `default`: VariableProtocol {
        return JOPString(value: value)
    }
    
    let value: String
    
    init?(_ value: JSON, runner: Runner) {
        if var str = value.string, str.first != "$" {
            if str.prefix(2) == #"\$"# {
                str.replaceSubrange(str.startIndex...str.index(after: str.startIndex), with: "$")
            }
            self.value = str
        } else {
            return nil
        }
    }
}
