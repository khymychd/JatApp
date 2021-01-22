//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import UIKit

class LoginViewController: UIViewController,WrongInputHandller {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    //MARK: - Variables
   
    //State
    var isLoginButtonShouldBeActive: Bool!{
        didSet{
           
            loginButton.isEnabled = self.isLoginButtonShouldBeActive
            loginButton.backgroundColor = self.isLoginButtonShouldBeActive ? UIColor.purple : UIColor.gray
        }
    }
    
   
    
   var presenter:LoginInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldsDelegate()
        self.isLoginButtonShouldBeActive = false
        hideKeyboardWhenTappedAround()
    }
    
    fileprivate func textFieldsDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: - Actions
    @IBAction func loginButtonDidPress(_ sender: UIButton) {
        presenter?.login()
    }
    
    @IBAction func signUpButtonDidPress(_ sender: UIButton) {
        presenter?.signUp()
    }

}

extension LoginViewController:LoginOutputProtocol {
   
    func wrongInputedData() {
        showAllert(with: "Something went wrong!")
    }
    
    
}


extension LoginViewController:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            return true
        case passwordTextField:
            return emailTextField.text?.isEmpty ?? true ? false:true
        default:
            break
        }
        return true
    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordTextField {
            self.isLoginButtonShouldBeActive = textField.text?.count ?? 0 > 6 ? true:false
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter?.input.email = emailTextField.text
        presenter?.input.password  = passwordTextField.text
        guard emailTextField.text == "" || passwordTextField.text == "" else {
            self.isLoginButtonShouldBeActive = true
            return
        }
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
