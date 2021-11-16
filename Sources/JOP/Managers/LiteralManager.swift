//
//  LiteralManager.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation
import SwiftyJSON

struct LiteralManager {
    static let shared = LiteralManager()
    
    func recognize(_ value: JSON, runner: Runner) throws -> VariableProtocol? {
        if let res = StringLiteral(value, runner: runner) {
            return res.default
        } else if let res = VariableLiteral(value, runner: runner)  {
            return try res.default
        } else if value.null != nil { // "type": Null
            return JOPVoid()
        }
        
        return nil
    }
}

/*
 string: "xxxx"
 int: 1
 double: 1.0
 var: "$....."
 */
