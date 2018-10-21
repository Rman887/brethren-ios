//
//  CreateAccountController.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class CreateAccountController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var errorText: UILabel!
    
    private var activeField: UITextField?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameField.delegate = self
        usernameField.tag = 1
        firstNameField.delegate = self
        firstNameField.tag = 2
        lastNameField.delegate = self
        lastNameField.tag = 3
        emailField.delegate = self
        emailField.tag = 4
    }
    
    private func validateInfo() -> Bool {
        return true
    }
    
    // MARK: - Editing
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    /* Cycle through inputs when the user presses return. */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.tag)
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
    
    // MARK: - Navigation

    
    @IBAction func next(_ sender: Any) {
        /* Close the keyboard. */
        if let activeField = self.activeField {
            activeField.resignFirstResponder()
        }
        
        if validateInfo() {
            self.performSegue(withIdentifier: "CreateUserSuccess", sender: self)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        DispatchQueue.main.async(execute: {
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "CreateUserSuccess") {
            let passwordController = segue.destination as! CreatePasswordController
            
            passwordController.username = self.usernameField.text
            passwordController.firstName = self.firstNameField.text
            passwordController.lastName = self.lastNameField.text
            passwordController.email = self.emailField.text
        }
    }
}
