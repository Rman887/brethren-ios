//
//  LoginController.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    private var activeField: UITextField?
    
    private var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Login
    @IBAction func login(_ sender: Any) {
        Session.performLogin(success: onLoginSuccess, failure: onLoginFailure)
    }
    
    private func onLoginSuccess() {
        self.performSegue(withIdentifier: "LoginSuccess", sender: self)
    }
    
    private func onLoginFailure(_ error: String) {
        
    }
}
