//
//  File.swift
//  
//
//  Created by 朱浩宇 on 2021/11/16.
//

import Foundation
import SwiftyJSON

struct ValueNormalization {
    static let shared = Self()
    
    func normalization(_ json: JSON, runner: Runner) throws -> VariableProtocol {
        do {
            if let value = try LiteralManager.shared.recognize(json, runner: runner) { // Literal
                return value
            }
        } catch {
            throw error
        }
        
        // TODO: - From var
        // TODO: - From Func / Class / Struct
        
        throw JOPNormalizationError(kind: .unrecognizedValue)
    }
}
