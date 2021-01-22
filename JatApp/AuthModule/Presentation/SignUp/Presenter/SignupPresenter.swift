//
//  SignupPresenter.swift
//  JatApp
//
//  Created by Dima Khymych on 18.01.2021.
//

import Foundation


protocol SignupInputProtocol {
    var input:SignupViewModel {get set}
    func signup()
    func close()
}

protocol SignupOutputProtocol:class {
    func signupFailure()
}


final class SignupPresenter:SignupInputProtocol {
    
    weak var view:SignupOutputProtocol?
    var authProvider:SignupUseCase
    var router:SignupRouterProtocol
    
    lazy var input = SignupViewModel()
    
    init(view:SignupOutputProtocol, authProvider:SignupUseCase,router:SignupRouterProtocol) {
        self.view = view
        self.authProvider = authProvider
        self.router = router
    }
    
    func signup() {
        guard let email = input.email , let password = input.password , let name = input.name else {
            view?.signupFailure()
            return
        }
        authProvider.signup(with: name, email: email, password: password)
        authProvider.succesAction = {[weak self] in self?.router.overFlow()}
        authProvider.failureAction = {[weak self] in self?.view?.signupFailure()}
    }
    
    func close() {
        router.popToLogin()
    }
    
    
}
