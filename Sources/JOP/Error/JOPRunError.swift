//
//  JOPRunError.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation

public struct JOPRunError: Error {
    public enum ErrorKind {
        case unableToParseJSON
        case unableToParseDict
        case missJSONKey(keyName: String)
        case errorJSONKey(keyName: String)
    }
    
    public let kind: ErrorKind
}
