//
//  KeyChainStorage.swift
//  JatApp
//
//  Created by Dima Khymych on 20.01.2021.
//

import Foundation


protocol TokenStorageProtocol {
    func set(value:String)
    func get() -> String?
}


struct TokenStorage:KeychainInterface {
    private let account = "token"
}


extension TokenStorage:TokenStorageProtocol {
    func get() -> String? {
        guard  let responce = load(key: self.account)
//               ,let data = Data(base64Encoded: responce)
         else {return nil}
        let stringToken = String(data: responce, encoding: .utf8)
        return stringToken
    }
    
    
    func set(value: String) {
        guard let wrapedTemp = value.data(using: .utf8)?.base64EncodedString(),let data = Data(base64Encoded: wrapedTemp)  else {
            return
        }
        var status = save(key: account, data: data)
        if errSecDuplicateItem == status {
            status = update(key: account, data: data)
        }
    }
    
    
}


