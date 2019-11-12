//
//  textFieldTableViewCell.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 11/11/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class textFieldTableViewCell: UITableViewCell {
    
    @IBOutlet var textField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
