//
//  Result.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation

enum Result <T,E> where E:Error {
    case succes(T)
    case failure(E)
}
