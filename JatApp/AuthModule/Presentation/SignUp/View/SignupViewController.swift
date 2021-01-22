//
//  SihgnupViewController.swift
//  JatApp
//
//  Created by Dima Khymych on 18.01.2021.
//

import UIKit

final class SignupViewController: UIViewController,WrongInputHandller {

    

    var presenter: SignupInputProtocol!
    
    //MARK: Outlets
    
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var signupButton:UIButton!
    
    
    //State
    var isSignupButtonShouldBeEnabled: Bool!{
        didSet{
            signupButton.isEnabled = self.isSignupButtonShouldBeEnabled
            signupButton.backgroundColor = self.isSignupButtonShouldBeEnabled ? UIColor.purple : UIColor.gray
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isSignupButtonShouldBeEnabled = false
        textFieldsDelegate()
        hideKeyboardWhenTappedAround()
      
    }
    
    
    func textFieldsDelegate() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    //MARK: - Actions
    
    @IBAction func signUpButtonDidPress (_ sender:UIButton) {
        presenter.signup()
    }
    
    @IBAction func closeButtonDidPress(_ sender:UIButton) {
        presenter.close()
    }
    

}

extension SignupViewController:SignupOutputProtocol {
    func signupFailure() {
        // show allert
        showAllert(with: "Opps, please try again")
    
    }
}

extension SignupViewController:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            return true
        case emailTextField:
            return nameTextField.text?.isEmpty ?? true ? false:true
        case passwordTextField:
            return emailTextField.text?.isEmpty ?? true ? false:true
        default:
            break
        }
        return true
    }
    
    
  
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.isSignupButtonShouldBeEnabled = false
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter.input.name = nameTextField.text
        presenter.input.email = emailTextField.text
        presenter.input.password = passwordTextField.text
        guard emailTextField.text == "" || passwordTextField.text == "" || nameTextField.text == "" else {
            self.isSignupButtonShouldBeEnabled = true
            return
        }
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordTextField {
            self.isSignupButtonShouldBeEnabled = textField.text?.count ?? 0 > 6 ? true:false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
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
