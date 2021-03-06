//
//  Scope.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation

struct Scope {
    var variables = [String : (value: VariableProtocol?, type: Types)]()
    var packages: [PackageProtocol.Type] = [Standard.self]
    var subScope: [Scope] = []
    var superScope: [Scope] = [] // Just One value will save
    
    mutating func defineVariable(name: String, type: Types) throws {
        if variables.contains(where: { $0.key == name }) {
            throw JOPVariableError(kind: .duplicateDefinition)
        } else {
            variables[name] = (nil, type)
        }
    }
    
    mutating func assignmentVariable(name: String, value: VariableProtocol) throws {
        if variables.contains(where: { $0.key == name }) {
            variables[name]?.value = value
        } else {
            throw JOPVariableError(kind: .undefinedVariable(name: name))
        }
    }
    
    func getVariable(_ name: String) throws -> VariableProtocol {
        if let res = variables[name]?.value {
            return res
        } else if let res = try subScope.first?.getVariable(name) {
            return res
        } else {
            throw JOPVariableError(kind: .undefinedVariable(name: name))
        }
    }
}
