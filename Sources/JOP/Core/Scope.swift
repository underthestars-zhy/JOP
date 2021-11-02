//
//  Scope.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation

struct Scope {
    static let main = Scope()
    
    var variables = [String : VariableProtocol]()
    
    mutating func addVariable(_ value: VariableProtocol, name: String) {
        variables[name] = value
    }
}
