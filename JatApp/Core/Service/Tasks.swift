//
//  Tasks.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation

typealias Headers = [String:String]
typealias Body  = Any

enum RequestType{
    // with no header
    case request
    // with header ContentType
    case requestWithHeader
    // uses token
    case requestWithAccesToken(String)
}
