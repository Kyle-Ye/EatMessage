//
//  Model+.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/27.
//

import Foundation
import IdentityLookup

extension Simple_4Output{
    var typeName:String{
        var type = ""
        switch self.label {
        case "normal":
            type = "正常短信"
        case "transaction":
            type = "交易信息"
        case "junk":
            type = "垃圾短信"
        case "unimportant":
            type = "不重要的短信"
        default:
            type = "其他短信"
        }
        return type
    }
}
extension ILMessageFilterAction{
    var result:String{
        switch self {
        case .junk:
            return "过滤"
        case .allow:
            return "不过滤"
        default:
            return "过滤情况未知"
        }
    }
}
