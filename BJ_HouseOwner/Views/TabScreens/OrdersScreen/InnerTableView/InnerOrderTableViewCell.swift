//
//  InnerOrderTableViewCell.swift
//  BJ_HouseOwner
//
//  Created by Project X on 4/4/20.
//  Copyright © 2020 beljomla.com. All rights reserved.
//

import UIKit

class InnerOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var wantedQuantityLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
