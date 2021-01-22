//
//  Assembly.swift
//  JatApp
//
//  Created by Dima Khymych on 20.01.2021.
//

import UIKit

protocol ContentAssemblyProtocol:MainAssemblyProtocol {
    func makeContentScreen() -> UIViewController 
}


final class ContentAssembly:ContentAssemblyProtocol {
   
    var serviceLocator: ServiceLocatorProtocol
    
    init (serviceLocator:ServiceLocatorProtocol ) {
        self.serviceLocator = serviceLocator
    }
    
    
    func makeContentScreen() -> UIViewController {
        let contentViewController = ContentViewController()
        let contentService = serviceLocator.getContentService()
        let tokenStorage = serviceLocator.getTokenStorage()
        let charCounter = CharCounter()
        let contentProvider = ContentProvider(contentService: contentService,
                                              tokenStorage: tokenStorage,
                                              charCounter: charCounter)
        let contentPresenter = ContentPresenter(view: contentViewController, contentProvider: contentProvider)
        contentViewController.presenter = contentPresenter
        return contentViewController
    }
    
}
