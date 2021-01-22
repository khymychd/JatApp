//
//  KeyChainStorage.swift
//  JatApp
//
//  Created by Dima Khymych on 20.01.2021.
//

import Foundation


protocol KeychainInterface {
    func save(key: String, data: Data) -> OSStatus
    func update(key:String, data:Data) -> OSStatus
    func load(key: String) -> Data?
    
}


extension KeychainInterface {
    func save(key: String, data: Data) -> OSStatus {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data as AnyObject] as [String : Any]
    
        
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    func update(key:String, data:Data) -> OSStatus {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key]
             as [String : Any]
        
        let attributes = [kSecValueData as String: data as AnyObject] as [String : Any]
        
        return SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
    }
    
    func load(key: String) -> Data? {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecMatchLimit as String  : kSecMatchLimitOne ,
            kSecReturnData as String  : kCFBooleanTrue!] as [String : AnyObject]
        
        var dataTypeRef:AnyObject?
        
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            return dataTypeRef as! Data?
        } else {
            return nil
        }
    }
    
    func createUniqueID() -> String {
            let uuid: CFUUID = CFUUIDCreate(nil)
            let cfStr: CFString = CFUUIDCreateString(nil, uuid)

            let swiftString: String = cfStr as String
            return swiftString
        }
}




