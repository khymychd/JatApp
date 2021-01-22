//
//  ContentRouter.swift
//  JatApp
//
//  Created by Dima Khymych on 21.01.2021.
//

import UIKit

protocol ContentRouterProtocol:MainRouter {
    var assembly:ContentAssemblyProtocol {get}
}


final class ContentRouter:ContentRouterProtocol{
    var assembly: ContentAssemblyProtocol
    
    var navigation: UINavigationController
    
    init(assembly: ContentAssemblyProtocol, navigation: UINavigationController) {
        self.assembly = assembly
        self.navigation = navigation
    }
    
    
    func startFlow() {
        let contentViewController = assembly.makeContentScreen()
        navigation.setViewControllers([contentViewController], animated: true)
    }
    
    func overFlow() {}
    
    
}


