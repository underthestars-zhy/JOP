//
//  VariableTypesManager.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation

struct VariableTypesManager {
    static let shared = VariableTypesManager()
    
    private(set) var types = [String : VariableProtocol.Type]()
    
    mutating func register(_ type: VariableProtocol.Type) {
        types[type.identify] = type
    }
    
    init() {
        register(JOPString.self)
    }
}
