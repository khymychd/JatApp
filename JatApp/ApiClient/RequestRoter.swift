//
//  RequestFactory.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation


final class RequestRoter {
    class func authRequest<T:Decodable>(type:ApiStore.AuthType,
                            body: Body?,
                            requestMethod:RequestMethod,
                            requestType:RequestType,
                            completion:@escaping (Result<T, ErrorHandler>) -> Void){
        let urlComponent = ApiStore.ApiURLComponent(path: type.rawValue)
        let requestComponent = ApiStore.ApiRequestComponents(url: urlComponent.url,
                                          body: body,
                                          method: requestMethod,
                                          requestType: requestType)
        let request = ApiStore.ApiRequest()
        
        request.request(request: requestComponent.request, completion: completion)
    }
    
    class func contentRequest<T:Decodable>(type:ApiStore.UsersPath ,
                            body: Body?,
                            requestMethod:RequestMethod,
                            requestType:RequestType,
                            query:Query?,
                            completion:@escaping (Result<T, ErrorHandler>) -> Void){
        let urlComponent = ApiStore.ApiURLComponent(path: type.path, query: query)
        
        let requestComponent = ApiStore.ApiRequestComponents(url: urlComponent.url,
                                          body: body,
                                          method: requestMethod,
                                          requestType: requestType)
        let request = ApiStore.ApiRequest()
        
        request.request(request: requestComponent.request, completion: completion)
    }
}
