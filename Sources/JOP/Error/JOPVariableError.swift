//
//  JOPVariableError.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation

public struct JOPVariableError: Error {
    public enum ErrorKind {
        case duplicateDefinition
        case undefinedType(type: String)
        case notNamedAtTheTimeOfDefinition
        case undefinedVariable(name: String)
        case unrecognizedValue
    }
    
    public let kind: ErrorKind
}
