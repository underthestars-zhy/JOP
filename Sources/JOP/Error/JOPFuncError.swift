//
//  JOPFuncError.swift
//  
//
//  Created by 朱浩宇 on 2021/11/3.
//

import Foundation

public struct JOPFuncError: Error {
    public enum ErrorKind {
        case unrecognizedValue
        case wrongName(name: String)
    }
    
    public let kind: ErrorKind
}

