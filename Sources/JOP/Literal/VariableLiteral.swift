//
//  VariableLiteral.swift
//  
//
//  Created by 朱浩宇 on 2021/11/16.
//

import Foundation
import SwiftyJSON
import Regex

struct VariableLiteral: LiteralProtocol {
    var `default`: VariableProtocol {
        get throws {
            return try runner.scope.getVariable(valueName)
        }
    }
    
    let runner: Runner
    let valueName: String
    
    init?(_ value: JSON, runner: Runner) {
        if let str = value.string, let valueName = Regex(#"^\$(.+)$"#).firstMatch(in: str).flatMap({ $0.captures.first?.flatMap { $0 } }) {
            self.runner = runner
            self.valueName = valueName
        } else {
            return nil
        }
    }
}
