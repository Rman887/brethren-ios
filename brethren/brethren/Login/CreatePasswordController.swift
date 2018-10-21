//
//  CreatePasswordController.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class CreatePasswordController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    public var username: String?
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    
    public var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordField.delegate = self
        passwordField.tag = 1
        confirmPasswordField.delegate = self
        confirmPasswordField.tag = 2
    }
    
    private func validatePassword() -> String? {
        if let text = self.passwordField.text, let confirmText = self.confirmPasswordField.text {
            if !text.isEmpty && text == confirmText {
                return text
            }
        }
        
        return nil
    }
    
    // MARK: - Editing
    
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

    @IBAction func createAccount(_ sender: Any) {
        /* Close the keyboard. */
        if let activeField = self.activeField {
            activeField.resignFirstResponder()
        }
        
        if let password = validatePassword() {
            Session.createAccount(username: self.username!, password: password, email: self.email!,
                                  firstName: self.firstName!, lastName: self.lastName!,
                                  success: onCreateSuccess, failure: onCreateFailure)
        }
    }
    
    private func onCreateSuccess(_ response: String) {
        self.performSegue(withIdentifier: "CreatePassSuccess", sender: self)
    }
    
    private func onCreateFailure(_ error: String) {
        
    }
}
