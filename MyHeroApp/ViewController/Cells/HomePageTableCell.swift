//
//  HomePageTableCell.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 21/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HomePageTableCell: UITableViewCell {

    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var lblNameHero: UILabel!
    @IBOutlet weak var lblRaceHero: UILabel!
    @IBOutlet weak var lblGenderHero: UILabel!
    @IBOutlet weak var lblNumberHero: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgHero.layer.cornerRadius = 42.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
