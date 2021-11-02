//
//  Processer.swift
//  
//
//  Created by 朱浩宇 on 2021/11/2.
//

import Foundation
import SwiftyJSON

public struct Processer {
    private(set) var json: JSON
    private(set) var filePath: URL
    private(set) var errorHandle: (Error) -> Void
    
    private(set) var mainJson: [JSON] = []
    
    
    public func start() {
        var processer = self
        if let mainJson = json["main"].array {
            processer.mainJson = mainJson
        }
        Runner(processer)?.run()
    }
    
    // MARK: - Callback
    
    private(set) var outPutCallBack: (OutPut) -> Void = { _ in }
    
    public func onOutPut(_ callBack: @escaping (OutPut) -> Void) -> Self {
        var processer = self
        processer.outPutCallBack = callBack
        return processer
    }
}
