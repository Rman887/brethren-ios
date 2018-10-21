//
//  LoginController.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var activeField: UITextField?
    
    private var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        passwordField.tag = 1
        passwordField.delegate = self
        passwordField.tag = 2
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.isHidden = true
    }
    
    // MARK: - Editting
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    /* Cycle through inputs when the user presses return. */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        /* Check if there is a next field to cycle to. */
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
            
        /* Last field is the password field, trigger login. */
        } else {
            textField.resignFirstResponder()
            self.performLogin()
        }
        
        return true
    }
    
    /* Update the active text field. */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
    }
    
    /* Update the active text field. */
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeField = nil
    }
    
    // MARK: - Login
    @IBAction func login(_ sender: Any) {
        /* Close the keyboard. */
        if let activeField = self.activeField {
            activeField.resignFirstResponder()
        }
        
        performLogin()
    }
    
    private func performLogin() {
        let username = self.usernameField.text ?? ""
        let password = self.passwordField.text ?? ""
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        Session.performLogin(username: username, password: password, success: onLoginSuccess, failure: onLoginFailure)
    }
    
    private func onLoginSuccess(_ response: [String: Any]) {
        Session.authToken = response["token"] as? String
        Session.user = User(id: response["id"] as! Int, username: response["username"] as! String, firstName: response["first_name"] as! String, lastName: response["last_name"] as! String, email: response["email"] as! String, pools: [])
        self.performSegue(withIdentifier: "LoginSuccess", sender: self)
    }
    
    private func onLoginFailure(_ error: String) {
        print("=====ERROR====LOL=====")
        print(error)
    }
}
