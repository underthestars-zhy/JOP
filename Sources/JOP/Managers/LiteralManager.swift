//
//  LiteralManager.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation
import SwiftyJSON

struct LiteralManager {
    static let shared = LiteralManager()
    
    func recognize(_ value: JSON) -> VariableProtocol? {
        if let str = value.string {
            return JOPString(value: str)
        } else if value.null != nil {
            return JOPVoid()
        }
        
        return nil
    }
}

/*
 string: "xxxx"
 int: 1
 double: 1.0
 */
