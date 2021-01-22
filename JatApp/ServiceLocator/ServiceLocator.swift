//
//  DI.swift
//  JatApp
//
//  Created by Dima Khymych on 21.01.2021.
//

import Foundation

protocol ServiceLocatorProtocol {
    func getTokenStorage() -> TokenStorageProtocol
    func getAuthService() -> AuthSeviceProtocol
    func getContentService() -> ContentServiceProtocol
}

final class ServiceLocator:ServiceLocatorProtocol {

    func getTokenStorage() -> TokenStorageProtocol {
        let tokenStorage = TokenStorage()
        return tokenStorage
    }
    
    func getAuthService() -> AuthSeviceProtocol {
        let authService = ApiClient.Auth()
        return authService
    }
    
    func getContentService() -> ContentServiceProtocol {
        let contentService = ApiClient.Content()
        return contentService
    }
}
