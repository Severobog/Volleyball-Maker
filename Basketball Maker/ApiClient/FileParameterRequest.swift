//
//  FileParameterRequest.swift
//  Receipt Manager
//  Basketball Maker
//
//  Created by Ярослав Агеенко on 06.09.2022.
//  Edited by Демид Стариков

import Foundation

class FileParameterRequest {
    var parameters = [String: Any]()
    
    static let fileData = "file_data"
    static let paramName = "param_name"
    static let fileName = "file_name"
    static let mimeType = "mime_type"
    
    init() {}
    
    func addParameter(key: String, value: Any?) {
        parameters[key] = value
    }
}
