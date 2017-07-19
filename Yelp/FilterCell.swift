//
//  FilterCell.swift
//  Yelp
//
//  Created by Kyle Sit on 7/19/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    //outlets
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
