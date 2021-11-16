//
//  PackageProtocol.swift
//  
//
//  Created by 朱浩宇 on 2021/11/3.
//

import Foundation
import SwiftyJSON

protocol PackageProtocol {
    static var name: String { get }
    static var inner: Bool { get }
    
    static func call(name: String, value: VariableProtocol, runner: Runner) throws -> VariableProtocol
}
