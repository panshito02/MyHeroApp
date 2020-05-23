//
//  HomePageCell.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 21/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HomePageCell: UICollectionViewCell {
    
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var lblNameHero: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgHero.layer.cornerRadius = 50.0
        //prepareCell()
    }
    
    func prepareCell(){
        
    }
}
