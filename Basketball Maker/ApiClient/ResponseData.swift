//
//  ResponseData.swift
//  Basketball Maker
//
//  Created by Ярослав Агеенко on 06.09.2022.
//  Edited by Демид Стариков

import Foundation

struct ResponseData {
    let responseCode: Int
    let responseMessage: String
    
    init(data: [String : Any]) {
        responseCode = data["ResponseCode"] as? Int ?? 0
        responseMessage = data["ResponseMsg"] as? String ?? ""
    }
}

struct ResponseStatus {
    static let fail = 0
    static let success = 1
    static let ConfirmationLink = 2
    static let SocialSignup = 3
    static let ForcefullyUpdate = 10
}
