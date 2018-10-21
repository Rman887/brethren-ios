//
//  AccountController.swift
//  brethren
//
//  Created by Arman Siddique on 10/21/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class AccountController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadUserData()
    }
    
    @IBAction func edit(_ sender: Any) {
        performSegue(withIdentifier: "EditUserFields", sender: self)
    }
    
    @IBAction func logout(_ sender: Any) {
        performSegue(withIdentifier: "Logout", sender: self)
    }
    
    @IBAction func unwindToAccount(segue: UIStoryboardSegue) {
        loadUserData()
    }
    
    private func loadUserData() {
        if let user = Session.user {
            fullNameLabel.text = user.firstName + " " + user.lastName
            usernameLabel.text = user.username
            emailLabel.text = user.email
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
