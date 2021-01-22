//
//  BaseRouter.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import UIKit

protocol MainRouter:AnyObject {
    var navigation:UINavigationController {get set}
    func startFlow()
    func overFlow()
}
