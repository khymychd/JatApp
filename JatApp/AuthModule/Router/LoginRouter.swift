//
//  LoginRouter.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import UIKit

protocol LoginRouterProtocol:MainRouter {
    var assembly: LoginAssemblyProtocol {get set}
    func showSignUpScreen()
    
}

protocol SignupRouterProtocol:MainRouter {
    func popToLogin()
}


final class LoginRouter {
   
    var navigation: UINavigationController

    var assembly: LoginAssemblyProtocol
    
    init(assembly: LoginAssemblyProtocol,navigation: UINavigationController) {
        self.assembly = assembly
        self.navigation = navigation
    }

}

extension LoginRouter: LoginRouterProtocol {
    func startFlow() {
        let loginController = assembly.makeLoginScreen(router: self)
        navigation.viewControllers = [loginController]
    }
    
    func overFlow() {
        let contentAssembly = ContentAssembly(serviceLocator: assembly.serviceLocator)
        let contentRouter = ContentRouter(assembly: contentAssembly, navigation: navigation)
        contentRouter.startFlow()
    }
    
    func showSignUpScreen() {
        let signupController = assembly.makeSignupScreen(router: self)
        navigation.pushViewController(signupController, animated: true)
    }

}
extension LoginRouter: SignupRouterProtocol {
    func popToLogin() {
        navigation.popToRootViewController(animated: true)
    }
}
