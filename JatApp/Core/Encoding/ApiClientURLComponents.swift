//
//ApiClientURL.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation



protocol ApiClientURLComponents {
    var scheme:RequestProtocol{get}
    var host:String{get}
    var path:String{get}
    var query:Query?{get}
}

extension ApiClientURLComponents {
    
    var scheme:RequestProtocol{
        return .https
    }
    
    var queryItems:[URLQueryItem]?{
        return query?.map({URLQueryItem(name: $0.key, value: "\($0.value)")})
    }
    var url:URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            fatalError("Error:URL doesnt valid")
        }
        return url
    }
}
