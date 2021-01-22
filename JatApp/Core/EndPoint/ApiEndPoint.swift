//
//  ApiEndPoint.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation




protocol ApiEndPoint {
    var url:URL {get}
    var headers:Headers? {get}
    var body:Body?{get}
    var method:RequestMethod {get}
    var requestType:RequestType {get}
}


extension ApiEndPoint {
    
    var headers:Headers? {
        var httpHeader = [String:String]()
        switch requestType {
        case .requestWithAccesToken(let token):
            httpHeader = ["Authorization":"Bearer" + " " + token]
            fallthrough
        case .requestWithHeader:
            httpHeader["Content-Type"] = "application/json"
        case .request:
            httpHeader.removeAll()
        }
        return httpHeader.isEmpty ? nil:httpHeader
    }
    
    var request:URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = method == .get ? nil: requestData
        request.allHTTPHeaderFields = headers
        return request
    }
    

    var requestData:Data? {
        guard let wrapedBody = body else {return nil}
        let jsonData = try? JSONSerialization.data(withJSONObject: wrapedBody, options: .fragmentsAllowed)
        return jsonData ?? nil
    }
    
    
    
}

