//
//  Configuration.swift
//  EatMessage
//
//  Created by 叶絮雷 on 2020/10/1.
//

import CoreML
import IdentityLookup

class SimpleConfiguration: MLModelConfiguration {
    
}
extension Simple_4{
    var filterJfunk:Bool{
        return UserDefaults(suiteName: suiteName)?.bool(forKey: s_junk) ?? true
    }
    var filterUnimportant:Bool{
        return UserDefaults(suiteName: suiteName)?.bool(forKey: s_unim) ?? true
    }
    var allowFiveDigit:Bool{
        return UserDefaults(suiteName: suiteName)?.bool(forKey: s_digi) ?? true
    }
    func MLMessagePredicate(_ messageBody:String) -> ILMessageFilterAction{
        if let result = try? self.prediction(text: messageBody){
            switch result.label {
            case "junk":
                if filterJfunk{
                    return .junk
                }else{
                    return .allow
                }
            case "unimportant":
                if filterUnimportant{
                    return .junk
                }else{
                    return .allow
                }
            case "transaction":
                return .transaction
            case "normal":
                return .allow
            default:
                return .none
            }
        }
        return .none
    }
}
