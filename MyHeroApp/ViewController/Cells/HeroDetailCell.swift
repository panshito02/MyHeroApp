//
//  HeroDetailCell.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 22/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HeroDetailCell: UITableViewCell {

    @IBOutlet weak var lblTitleDescription: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
