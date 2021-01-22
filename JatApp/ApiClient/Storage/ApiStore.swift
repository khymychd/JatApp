//
//  ApiStore.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation

final class ApiStore {
    struct ApiURLComponent:ApiClientURLComponents {
        var host: String {
            return "apiecho.cf"
        }
        
        var path: String
        
        var query: Query? = nil
        
    }
    
    struct ApiRequestComponents:ApiEndPoint {
        var url: URL
        
        var body: Body?
        
        var method: RequestMethod
        
        var requestType: RequestType
        
        
    }
    
    struct ApiRequest:Request {}
    
    enum AuthType:String {
        
        var rawValue: String{
            return "/api/\(self)/"
        }
        case login,logout,signup
       
    }
    
    enum UsersPath {
        case text,person
        
        var path:String {
            switch self {
            case .text:
                return "/api/get/text/"
            case .person:
                return "/api/get/person/"
        }
    
    }
    
}

}
