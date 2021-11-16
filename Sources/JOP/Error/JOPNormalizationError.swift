//
//  JOPNormalizationError.swift
//  
//
//  Created by 朱浩宇 on 2021/11/16.
//

import Foundation

public struct JOPNormalizationError: Error {
    public enum ErrorKind {
        case unrecognizedValue
    }
    
    public let kind: ErrorKind
}
