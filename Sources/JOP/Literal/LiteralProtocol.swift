//
//  File.swift
//  
//
//  Created by 朱浩宇 on 2021/11/15.
//

import Foundation
import SwiftyJSON

protocol LiteralProtocol {
    var `default`: VariableProtocol { get throws }
    
    init?(_ value: JSON, runner: Runner)
}
