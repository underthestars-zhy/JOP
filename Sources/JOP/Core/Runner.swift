//
//  Runner.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation
import SwiftyJSON

struct Runner {
    let processer: Processer
    
    init?(_ processer: Processer?) {
        if let processer = processer {
            self.processer = processer
        } else {
            return nil
        }
    }
    
    func run() {
        for json in processer.mainJson {
            guard let command = json["command"].string else {
                processer.errorHandle(JOPRunError(kind: .missJSONKey(keyName: "command")))
                return
            }
            
            do {
                try distribute(command, json: json)
            } catch {
                processer.errorHandle(error)
            }
        }
    }
    
    private func distribute(_ text: String, json: JSON) throws {
        do {
            switch text {
            case "define": try difine(json)
            default: throw JOPRunError(kind: .errorJSONKey(keyName: text))
            }
        } catch {
            throw error
        }
    }
    
    // MARK: - Distribute
    private func difine(_ json: JSON) throws {
        
    }
}
