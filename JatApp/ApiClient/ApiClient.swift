//
//  ApiClient.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation

protocol AuthSeviceProtocol {
    func login<D:Decodable>(userModel:Login, completion:@escaping(Result<LoginResponce<D>, ErrorHandler>) -> Void)
    func logout()
    func signup<D:Decodable>(userModel:Signup, completion:@escaping(Result<LoginResponce<D>, ErrorHandler>) -> Void)
}

final class ApiClient {
    class Auth {}
    class Content{}
    
}

