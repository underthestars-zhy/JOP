//
//  Runner.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation
import SwiftyJSON

class Runner {
    let processer: Processer
    var scope = Scope()
    
    init?(_ processer: Processer?) {
        if let processer = processer {
            self.processer = processer
        } else {
            return nil
        }
    }
    
    func run() {
        for json in processer.mainJson {
            do {
                try distribute(json)
            } catch {
                processer.errorHandle(error)
            }
        }
    }
    
    private func distribute(_ json: JSON) throws {
        switch try Parser.parser(json: json, processer: processer) {
        case .pass: return
        case .define: try define(json)
        case .assignment: try assignment(json)
        case .call: _ = try call(json) // single call
        }
    }
    
    // MARK: - Distribute
    private func define(_ json: JSON) throws {
        if let type = json["type"].string {
            if let v = VariableTypesManager.shared.types[type] {
                if let name = json["name"].string {
                    try scope.defineVariable(name: name, type: v.type)
                } else {
                    throw JOPVariableError(kind: .notNamedAtTheTimeOfDefinition)
                }
            } else {
                throw JOPVariableError(kind: .undefinedType(type: type))
            }
        } else {
            throw JOPRunError(kind: .missJSONKey(keyName: "type"))
        }
    }
    
    private func assignment(_ json: JSON) throws {
        if let value = try LiteralManager.shared.recognize(json["value"], runner: self) {
            if let name = json["name"].string {
                try scope.assignmentVariable(name: name, value: value)
            } else {
                throw JOPRunError(kind: .missJSONKey(keyName: "name"))
            }
        } else {
            throw JOPVariableError(kind: .unrecognizedValue)
        }
    }
    
    private func call(_ json: JSON) throws -> VariableProtocol {
        guard let type = json["type"].string else {
            throw JOPRunError(kind: .missJSONKey(keyName: "type"))
        }
        
        guard let name = json["name"].string else {
            throw JOPRunError(kind: .missJSONKey(keyName: "name"))
        }
        
        if json.contains(where: { $0.0 == "package" }) {
            
        } else { // Standard Package
            if type == "func" {
                return try Standard.call(name: name, value: try ValueNormalization.shared.normalization(json["passBy"], runner: self), runner: self)
            }
        }
        
        return JOPVoid() // TODO: Remove
    }
}
