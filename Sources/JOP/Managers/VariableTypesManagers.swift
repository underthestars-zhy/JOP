//
//  VariableTypesManagers.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation

struct VariableTypesManagers {
    static let shared = VariableTypesManagers()
    
    private(set) var types = [String : VariableProtocol.Type]()
    
    mutating func register(_ type: VariableProtocol.Type) {
        types[type.identify] = type
    }
    
    init() {
        register(JOPString.self)
    }
}
