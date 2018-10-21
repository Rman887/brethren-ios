//
//  LoginChoiceController.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class LoginChoiceController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    @IBAction func signIn(_ sender: Any) {
        self.performSegue(withIdentifier: "Login", sender: self)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        self.performSegue(withIdentifier: "CreateAccount", sender: self)
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
