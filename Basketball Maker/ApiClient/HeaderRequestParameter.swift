//
//  HeaderRequest.swift
//  Basketball Maker
//
//  Created by Ярослав Агеенко on 06.09.2022.
//  Edited by Демид Стариков

import Foundation

class HeaderRequestParameter {
    var parameters = [String : String]()
    
    static let Token = "token"
    static let Key = "key"
    
    init() {}

    func addParameter(key: String, value: String) {
        parameters[key] = value
    }
}
