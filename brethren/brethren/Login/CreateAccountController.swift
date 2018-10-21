//
//  CreateAccountController.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class CreateAccountController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func validateInfo() -> Bool {
        return true
    }
    
    // MARK: - Navigation

    
    @IBAction func next(_ sender: Any) {
        if validateInfo() {
            self.performSegue(withIdentifier: "CreateUserSuccess", sender: self)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        DispatchQueue.main.async(execute: {
            self.dismiss(animated: true, completion: nil)
            //self.navigationController?.popViewController(animated: true)
        })
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
