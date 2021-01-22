//
//  LoginProvider.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation

public typealias Action = () -> Void


protocol AuthProviderProtocol {
    
    var failureAction:Action? {get set}

    var succesAction:Action? {get set}
    
    init(loginService: AuthSeviceProtocol, storage:TokenStorageProtocol )
}




final class AuthProvider:AuthProviderProtocol {

    var failureAction: Action?
    var succesAction: Action?
    let loginService:AuthSeviceProtocol
    
    let storage: TokenStorageProtocol
    
    init(loginService: AuthSeviceProtocol, storage:TokenStorageProtocol ) {
        self.loginService = loginService
        self.storage = storage
    }
    
}


extension AuthProvider:LoginUseCase{
    func login(with email: String, password: String) {
        let userModel = Login(email: email, password: password)
        DispatchQueue.global(qos: .userInteractive).async {
            self.loginService.login(userModel: userModel) {[weak self] (result:Result<LoginResponce<User>, ErrorHandler>) in
                DispatchQueue.main.async {
                    switch result {
                    case .succes(let responce):
                        self?.succesAction?()
                        if let token = responce.data?.accessToken {
                            self?.storage.set(value: token)
                        }else{
                            self?.failureAction?()
                        }
                    case .failure(let error):
                        print("Request Error \(error) ")
                        self?.failureAction?()
                    }
                }
                
            }
        }
       
    }
}


extension AuthProvider:SignupUseCase {
    func signup(with name: String, email: String, password: String) {
        let signupModel = Signup(name: name, email: email, password: password)
        DispatchQueue.global(qos: .userInteractive).async {
            self.loginService.signup(userModel: signupModel) {[weak self] (result:Result<LoginResponce<User>, ErrorHandler>) in
                DispatchQueue.main.async {
                    switch result {
                    case .succes(let responce):
                        if let token = responce.data?.accessToken {
                            self?.storage.set(value : token)
                        }
                        self?.succesAction?()
                    case .failure(_):
                        print("Error")
                        self?.failureAction?()
                    }
                }
              
            }
        }
        
    
    }
    
    
}
