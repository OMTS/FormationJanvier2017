//
//  RestoCell.swift
//  RestoFinder
//
//  Created by Iman Zarrabian on 11/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import UIKit

class RestoCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var restoIV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
