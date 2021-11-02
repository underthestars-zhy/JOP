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
            if let command = json["command"].string {
                distribute(command, json: json)
            } else {
                processer.errorHandle(JOPRunError(kind: .missJSONKey(keyName: "command")))
            }
        }
    }
    
    private func distribute(_ text: String, json: JSON) {
        
    }
}
