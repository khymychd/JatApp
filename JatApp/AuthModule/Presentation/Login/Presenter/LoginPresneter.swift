//
//  LoginPresneter.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation



final class LoginPresenter {
    
   weak var view:LoginOutputProtocol?
    var provider:LoginUseCase
    let router:LoginRouterProtocol
    
    lazy var input = LoginViewModel()
    
    init(view:LoginOutputProtocol,
         provider:LoginUseCase,
         router:LoginRouterProtocol) {
        self.view = view
        self.provider = provider
        self.router = router
    }
}


extension LoginPresenter:LoginInputProtocol {
    func login() {
        guard let email = input.email , let password = input.password else {
            view?.wrongInputedData()
            return
        }
        provider.login(with: email, password: password)
        provider.succesAction = {[weak self] in self?.router.overFlow() }
        provider.failureAction = { [weak self] in self?.view?.wrongInputedData()}
    }
    

    
    func signUp() {
        router.showSignUpScreen()
    }
}
