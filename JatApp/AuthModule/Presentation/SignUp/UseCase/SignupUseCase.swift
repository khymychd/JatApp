//
//  SignupUseCase.swift
//  JatApp
//
//  Created by Dima Khymych on 18.01.2021.
//

import Foundation

protocol SignupUseCase:AuthProviderProtocol {
    func signup(with name:String,
                email:String,
                password:String)
}
