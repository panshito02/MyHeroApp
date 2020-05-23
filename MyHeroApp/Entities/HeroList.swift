//
//  HeroList.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 22/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit
import ObjectMapper
class HeroList :Mappable {

    
    var heros :[Hero]? = [Hero]()
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        heros <- map["results"]
    }
    
    init() {
        
    }
}
