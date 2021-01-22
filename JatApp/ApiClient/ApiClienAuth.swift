//
//  ApiClienAuth.swift
//  JatApp
//
//  Created by Dima Khymych on 20.01.2021.
//

import Foundation




extension ApiClient.Auth:AuthSeviceProtocol {
    func login<D>(userModel:Login, completion:@escaping(Result<LoginResponce<D>, ErrorHandler>) -> Void) where D : Decodable {
        guard let requestData = try? userModel.mapToDictionary() else {return}
        RequestRoter.authRequest(type: .login,
                                 body: requestData,
                                 requestMethod: .post,
                                 requestType: .requestWithHeader,
                                 completion: completion)
    }
    
    
    
    
    func logout() {
        //Incapusulate data to network request
       
        
    }
    
    func signup<D>(userModel: Signup, completion: @escaping (Result<LoginResponce<D>, ErrorHandler>) -> Void) where D : Decodable {
        guard let requestData = try? userModel.mapToDictionary() else {return}
        RequestRoter.authRequest(type: .signup,
                                 body: requestData,
                                 requestMethod: .post,
                                 requestType: .requestWithHeader,
                                 completion: completion)
    }
    
}

