//
//  LoginUseCase.swift
//  JatApp
//
//  Created by Dima Khymych on 18.01.2021.
//

import Foundation

protocol LoginUseCase:AuthProviderProtocol {
    func login(with email:String , password:String)
}
