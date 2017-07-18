//
//  BusinessCell.swift
//  Yelp
//
//  Created by Kyle Sit on 2/16/17.
//  Copyright © 2017 Kyle Sit. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    //Outlets to the cell
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    //when a business changes for a cell we automatically update components
    var business: Business! {
        didSet {
            nameLabel.text = business.name
            if business.imageURL != nil {
                thumbImageView.setImageWith(business.imageURL!)
            }
            categoriesLabel.text = business.categories
            addressLabel.text = business.address
            reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
            ratingImageView.setImageWith(business.ratingImageURL!)
            distanceLabel.text = business.distance
        }
    }
    
    
    //awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //rounding edges
        thumbImageView.layer.cornerRadius = 4
        thumbImageView.clipsToBounds  = true
        
        //autolayout prefs
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }
    
    
    //set parameters for autoloayout
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }

    
    //selection animation
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
