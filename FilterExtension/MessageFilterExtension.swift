//
//  MessageFilterExtension.swift
//  FilterExtension
//
//  Created by 叶絮雷 on 2020/9/27.
//

import IdentityLookup

final class MessageFilterExtension: ILMessageFilterExtension {}

extension MessageFilterExtension: ILMessageFilterQueryHandling {
    func handle(_ queryRequest: ILMessageFilterQueryRequest, context: ILMessageFilterExtensionContext, completion: @escaping (ILMessageFilterQueryResponse) -> Void) {
        let offlineAction = self.offlineAction(for: queryRequest)
        let response = ILMessageFilterQueryResponse()
        response.action = offlineAction
        completion(response)
    }

    private func offlineAction(for queryRequest: ILMessageFilterQueryRequest) -> ILMessageFilterAction {
//        guard let messageBody = queryRequest.messageBody else {
//            return .none
//        }
//        guard let sender = queryRequest.sender else {
//            return .none
//        }
//        if allowFiveDigit && sender.count == 5{
//            return .allow
//        }
//        let model = Simple()
//        let a = try! model.prediction(text: messageBody)
//        switch a.label {
//        case "spam":
//            return .junk
//        case "tran":
//            return .transaction
//        case "normal":
//            return .allow
//        default:
//            return .none
//        }
        return .none
    }
    
    private var allowFiveDigit:Bool{
        return true
    }
}
