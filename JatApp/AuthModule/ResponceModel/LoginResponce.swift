//
//  LoginResponce.swift
//  JatApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation

struct LoginResponce<T>:Decodable where T:Decodable {
    var success:Bool
    var data:T?
}

struct User:Decodable {
    
    var name:String?
    var email:String?
    var accessToken:String?
   
}
