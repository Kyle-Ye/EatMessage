//
//  MessageFilterExtension.swift
//  FilterExtension
//
//  Created by 叶絮雷 on 2020/9/27.
//

import IdentityLookup
import CoreML

final class MessageFilterExtension: ILMessageFilterExtension {}

extension MessageFilterExtension: ILMessageFilterQueryHandling {
    func handle(_ queryRequest: ILMessageFilterQueryRequest, context: ILMessageFilterExtensionContext, completion: @escaping (ILMessageFilterQueryResponse) -> Void) {
        let offlineAction = self.offlineAction(for: queryRequest)
        let response = ILMessageFilterQueryResponse()
        response.action = offlineAction
        completion(response)
    }

    private func offlineAction(for queryRequest: ILMessageFilterQueryRequest) -> ILMessageFilterAction {
        guard let messageBody = queryRequest.messageBody else {
            return .none
        }
        guard let sender = queryRequest.sender else {
            return .none
        }
        
        do {
            let model = try Simple_4(configuration: SimpleConfiguration())
            
            // TODO: Rule1: Number list
            
            // Rule2: 5 digit check
            if model.allowFiveDigit && sender.count == 5{
                return .allow
            }
            // Rule3: Keyword list
            
            // Rule4: ML model desicion
            return model.MLMessagePredicate(messageBody)
            
        } catch {
            print(error.localizedDescription)
        }
        return .none
    }

}

