//
//  Encoding+Extension.swift
//  JatApp
//
//  Created by Dima Khymych on 18.01.2021.
//

import Foundation
public typealias Parameters = [String:Any]

extension Encodable {
    
    func mapToDictionary() throws -> Parameters {
        
        let encoder = JSONEncoder()
        
         encoder.keyEncodingStrategy = .convertToSnakeCase
        
        let data = try encoder.encode(self)
        
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Parameters else {throw NSError() }
        
        return dictionary
        
    }

}
