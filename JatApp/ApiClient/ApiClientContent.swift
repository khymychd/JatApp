//
//  ApiClientContent.swift
//  JatApp
//
//  Created by Dima Khymych on 20.01.2021.
//

import Foundation



protocol ContentServiceProtocol {
    func getText <T:Decodable>(with token:String,completion:@escaping(Result<T,ErrorHandler>)->Void)
}



extension ApiClient.Content:ContentServiceProtocol {
    func getText<T>(with token:String,completion: @escaping (Result<T, ErrorHandler>) -> Void) where T : Decodable {
        let query = ["locale":"en_NG"]
        RequestRoter.contentRequest(type: .text, body: nil, requestMethod: .get, requestType: .requestWithAccesToken(token), query: query, completion: completion)
    }
    
    
}
