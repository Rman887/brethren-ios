//
//  SettingsController.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
    static var NUM_FIELDS = 3

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    @IBAction func cancel(_ sender: Any) {
        DispatchQueue.main.async(execute: {
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    @IBAction func save(_ sender: Any) {
        guard let user = Session.user else {
            return
        }
        
        let cells = self.tableView.visibleCells
        for cell in cells {
            let settingsTableCell = cell as! SettingsTableCell
            if let fieldValue = settingsTableCell.fieldValue, let text = fieldValue.text {
                if text.isEmpty {
                    return
                }
            } else {
                return
            }
        }
        
        for cell in cells {
            let settingsTableCell = cell as! SettingsTableCell
            let fieldValue = settingsTableCell.fieldValue!.text!
            
            switch settingsTableCell.fieldName!.text! {
            case "First Name":
                user.firstName = fieldValue
            case "Last Name":
                user.lastName = fieldValue
            case "Email":
                user.email = fieldValue
            default:
                continue
            }
        }
        
        /*DispatchQueue.main.async(execute: {
            self.dismiss(animated: true, completion: nil)
        })*/
        self.performSegue(withIdentifier: "unwindToAccount", sender: self)
    }
    // MARK: - Table functions
    
    /** Gets the number of sections on the table view. */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /** Returns the number of fields that a user has. */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsController.NUM_FIELDS
    }
    
    /** Get the cell at the given row index. */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* Get the old cell. */
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableCell", for: indexPath) as? SettingsTableCell else {
            fatalError("Dequeued cell not instance of SettingsTableCell")
        }
        
        guard let user = Session.user else {
            return cell
        }
        
        /* Configure it to reflect new information. */
        switch (indexPath.row) {
        case 0:
            cell.fieldName.text = "First Name"
            cell.fieldValue.text = user.firstName
        case 1:
            cell.fieldName.text = "Last Name"
            cell.fieldValue.text = user.lastName
        case 2:
            cell.fieldName.text = "Email"
            cell.fieldValue.text = user.email
        default:
            cell.fieldName.text = ""
            cell.fieldValue.text = ""
        }
        
        return cell
    }
    
    /** Called when a row is selected. */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    /** Return the height for the selected cell. */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
