//
//  Parser.swift
//  
//
//  Created by 朱浩宇 on 2021/11/15.
//

import Foundation
import SwiftyJSON

enum Parser {
    case pass
    case define
    case assignment
    case call
    
    static func parser(json: JSON, processer: Processer) throws -> Self {
        guard let command = json["command"].string else {
            processer.errorHandle(JOPRunError(kind: .missJSONKey(keyName: "command")))
            return
        }
        
        if json["mark"].string == "pass" || json["mark"].array?.contains(where: {$0.string == "pass"}) {
            return .pass
        } else if command == "define" {
            return .define
        } else if command == "assignment" {
            return .assignment
        } else if command == "call" {
            return .call
        }
        
        throw JOPRunError(kind: .errorJSONKey(keyName: text))
    }
}
