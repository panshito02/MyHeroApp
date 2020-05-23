//
//  HeroDetails.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 22/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HeroDetails {
    var titleDescription:String?
    var description:String?
    
    init(){
        
    }
    
    init(titleDescription: String, description: String){
        self.titleDescription = titleDescription
        self.description = description
    }
}
