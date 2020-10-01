//
//  Model+.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/27.
//

import Foundation

extension SimpleOutput{
    var typeName:String{
        var type = ""
        switch self.label {
        case "ad":
            type = "广告"
        case "code":
            type = "验证码短信"
        case "public_ad":
            type = "公益广告"
        case "normal":
            type = "正常短信"
        case "transaction":
            type = "交易信息"
        case "junk":
            type = "垃圾短信"
        // 推广短信
        default:
            type = "其他"
        }
        return type
    }
    
    var filterResult:String{
        switch self.label {
        case "ad","junk":
            return "过滤"
        default:
            return "不过滤"
        }
    }
}
