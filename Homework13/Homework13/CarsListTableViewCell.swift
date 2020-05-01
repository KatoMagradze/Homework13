//
//  CarsListTableViewCell.swift
//  Homework13
//
//  Created by Kato on 5/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CarsListTableViewCell: UITableViewCell {

    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var modelPriceLabel: UILabel!
    @IBOutlet weak var modelImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
