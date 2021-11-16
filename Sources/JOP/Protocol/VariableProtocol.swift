//
//  VariableProtocol.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation

protocol VariableProtocol {
    static var identify: String { get }
    static var type: Types { get }
    var type: Types { get }
}

extension VariableProtocol{
    var type: Types {
        Self.type
    }
}
