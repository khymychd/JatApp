//
//  WrongInputHandller.swift
//  JatApp
//
//  Created by Dima Khymych on 22.01.2021.
//

import UIKit

protocol WrongInputHandller {
    func showAllert(with message:String, handler:((UIAlertAction) -> Void)?) 
}

extension WrongInputHandller  where Self:UIViewController{
    func showAllert(with message:String, handler:((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
        self.present(alert, animated: true, completion: nil)
    }
}
