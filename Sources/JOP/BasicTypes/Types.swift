//
//  Types.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation

enum Types {
    case string
    case void
    
    static func fromString(_ text: String) -> Self? {
        switch text {
        case "String": return .string
        case "Void": return .void
        default: return nil
        }
    }
}
