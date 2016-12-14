//
//  AppsTableViewCell.swift
//  GrabilityTrial
//
//  Created by Jefferson Vélez Escobar on 14/12/16.
//  Copyright © 2016 Jefferson Vélez Escobar. All rights reserved.
//

import UIKit

class AppsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var title: UILabel!
    @IBOutlet var author: UILabel!
    @IBOutlet var imageLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
