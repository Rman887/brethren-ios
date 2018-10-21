//
//  CreatePasswordController.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class CreatePasswordController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func validatePassword() -> Bool {
        return true
    }
    
    // MARK: - Login

    @IBAction func createAccount(_ sender: Any) {
        if validatePassword() {
            Session.performLogin(success: onLoginSuccess, failure: onLoginFailure)
        }
    }
    
    private func onLoginSuccess() {
        self.performSegue(withIdentifier: "CreatePassSuccess", sender: self)
    }
    
    private func onLoginFailure(_ error: String) {
        
    }
}
