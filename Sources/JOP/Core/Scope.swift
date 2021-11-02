//
//  Scope.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation

struct Scope {
    static var main = Scope()
    
    var variables = [String : (value: VariableProtocol?, type: Types)]()
    
    mutating func defineVariable(name: String, type: Types) throws {
        if variables.contains(where: { $0.key == name }) {
            throw JOPVariableError(kind: .duplicateDefinition)
        } else {
            variables[name] = (nil, type)
        }
    }
}
