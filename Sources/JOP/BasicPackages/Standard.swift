//
//  Standard.swift
//  
//
//  Created by 朱浩宇 on 2021/11/3.
//

import Foundation
import SwiftyJSON

struct Standard: PackageProtocol {
    static let name: String = "Standard"
    static let inner: Bool = true
    
    static func call(name: String, value: VariableProtocol, runner: Runner) throws -> VariableProtocol {
        // TODO: Multiple Value
        guard verify(name, value: value) else { throw JOPVariableError(kind: .typeError(call: name)) }
        
        switch name {
        case "print": return try _print(value: value, runner: runner)
        default: throw JOPFuncError(kind: .wrongName(name: name))
        }
    }
    
    static private func _print(value: VariableProtocol, runner: Runner) throws -> VariableProtocol {
        let outPut = OutPut(color: nil, bold: false, text: (value as! JOPString).value)
        runner.processer.outPutCallBack(outPut)
        return JOPVoid()
    }
    
    static private func verify(_ name: String, value: VariableProtocol) -> Bool {
        switch name {
        case "print": return value.type == .string
        default: return false
        }
    }
}
