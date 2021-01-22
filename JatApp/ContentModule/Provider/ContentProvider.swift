//
//  ContentProvider.swift
//  JatApp
//
//  Created by Dima Khymych on 20.01.2021.
//

import Foundation

protocol ContentProviderProtocol {
    func getContent (completion:@escaping([Character:Int]) -> Void)
}



final class ContentProvider:ContentProviderProtocol {

    let contentService:ContentServiceProtocol
    let tokenStorage:TokenStorageProtocol
    let charCounter:CharCounterProtocol
    

    init(contentService:ContentServiceProtocol,
          tokenStorage:TokenStorageProtocol,
          charCounter:CharCounterProtocol) {
        self.contentService = contentService
        self.tokenStorage = tokenStorage
        self.charCounter = charCounter
    }
    
    func getContent (completion:@escaping([Character:Int]) -> Void) {
        if let token = self.tokenStorage.get() {
        DispatchQueue.global(qos: .background).async {
            self.contentService.getText(with: token) {[weak self] (result:Result<TextResponce,ErrorHandler>) in
                    DispatchQueue.main.async {
                        switch result {
                        case.succes(let responce):
                            if let string = responce.data , let chars = self?.charCounter.countOccurrence(by: string)  {
                                completion(chars)
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }

                }
            }
           
        }
    }
    
}


