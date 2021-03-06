import Foundation
import SwiftyJSON

public struct JOP {
    public static func run(_ text: String, filePath: URL, errorHandle: ((Error) -> Void)? = nil) -> Processer? {
        do {
            if let dataFromString = text.data(using: .utf8, allowLossyConversion: false) {
                return Processer(json: try JSON(data: dataFromString), filePath: filePath, errorHandle: errorHandle ?? { _ in })
            } else {
                if let errorHandle = errorHandle {
                    errorHandle(JOPRunError(kind: .unableToParseJSON))
                }
            }
        } catch {
            if let errorHandle = errorHandle {
                errorHandle(error)
            }
        }
        
        return nil
    }
    
    public static func run(_ dict: [String : Any], filePath: URL, errorHandle: ((Error) -> Void)? = nil) -> Processer? {
        guard !dict.isEmpty else {
            if let errorHandle = errorHandle {
                errorHandle(JOPRunError(kind: .unableToParseDict))
            }
            return nil
        }
        
        return Processer(json: JSON(dict), filePath: filePath, errorHandle: errorHandle ?? { _ in })
    }
}
