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
    var packageManager = PackageManager()
    
    init?(_ processer: Processer?) {
        if let processer = processer {
            self.processer = processer
        } else {
            return nil
        }
    }
    
    func run() {
        for json in processer.mainJson {
            guard let command = json["command"].string else {
                processer.errorHandle(JOPRunError(kind: .missJSONKey(keyName: "command")))
                return
            }
            
            do {
                try distribute(command, json: json)
            } catch {
                processer.errorHandle(error)
            }
        }
    }
    
    private func distribute(_ text: String, json: JSON) throws {
        do {
            switch text {
            case "define": try define(json)
            case "assignment": try assignment(json)
            case "call": try call(json)
            default: throw JOPRunError(kind: .errorJSONKey(keyName: text))
            }
        } catch {
            throw error
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
        if let value = LiteralManager.shared.recognize(json["value"]) {
            if let name = json["name"].string {
                try scope.assignmentVariable(name: name, value: value)
            } else {
                throw JOPRunError(kind: .missJSONKey(keyName: "name"))
            }
        } else {
            throw JOPVariableError(kind: .unrecognizedValue)
        }
    }
    
    private func call(_ json: JSON) throws {
        if let type = json["type"].string {
            if let name = json["name"].string {
                if let value = LiteralManager.shared.recognize(json["value"]) {
                    if json.contains(where: { $0.0 == "package" }) {
                        
                    } else { // Base Package
                        
                    }
                } else {
                    throw JOPFuncError(kind: .unrecognizedValue)
                }
            } else {
                throw JOPRunError(kind: .missJSONKey(keyName: "name"))
            }
        } else {
            throw JOPRunError(kind: .missJSONKey(keyName: "type"))
        }
    }
}
