//
//  LoginAssembly.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import UIKit

protocol LoginAssemblyProtocol:MainAssemblyProtocol {
    func makeLoginScreen(router:LoginRouterProtocol) -> UIViewController
    func makeSignupScreen(router:SignupRouterProtocol) -> UIViewController
}

final class LoginAssembly:LoginAssemblyProtocol {
   
    var serviceLocator: ServiceLocatorProtocol
    
    init(serviceLocator:ServiceLocatorProtocol) {
        self.serviceLocator = serviceLocator
    }
  
    func makeLoginScreen(router:LoginRouterProtocol) -> UIViewController{
        let loginViewController = LoginViewController()
        let autorizeService = serviceLocator.getAuthService()
        let authStorage = serviceLocator.getTokenStorage()
        let loginProvider = AuthProvider(loginService: autorizeService, storage: authStorage)
        let loginPresenter = LoginPresenter(view: loginViewController,
                                            provider: loginProvider,
                                            router: router)
        loginViewController.presenter = loginPresenter
        return loginViewController
    }
    
    func makeSignupScreen(router:SignupRouterProtocol) -> UIViewController {
        let signupViewController = SignupViewController()
        let autorizeService = ApiClient.Auth()
        let authStorage = TokenStorage()
        let loginProvider = AuthProvider(loginService: autorizeService, storage: authStorage)
        let signupPresenter = SignupPresenter(view: signupViewController,
                                              authProvider: loginProvider,
                                              router: router)
        signupViewController.presenter = signupPresenter
        return signupViewController
    }
    
}
