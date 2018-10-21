//
//  SettingsTableCell.swift
//  brethren
//
//  Created by Arman Siddique on 10/20/18.
//  Copyright © 2018 Cornelius and Co. All rights reserved.
//

import UIKit

class SettingsTableCell: UITableViewCell {
    
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var fieldValue: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
