//
//  LoginOutputProtocol.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation
protocol LoginInputProtocol:class {
    var input:LoginViewModel {get set}
    func login()
    func signUp()
}
