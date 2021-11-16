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
    
    static func call(name: String, value: JSON) throws -> VariableProtocol {
        do {
            switch name {
            case "print": return try _print(value: value)
            default: throw JOPFuncError(kind: .wrongName(name: name))
            }
        } catch {
            throw error
        }
    }
    
    static private func _print(value: JSON) throws -> VariableProtocol {
        
    }
}
