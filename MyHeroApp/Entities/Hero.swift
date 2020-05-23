//
//  Hero.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 21/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit
import ObjectMapper
class Hero : Mappable {
    required init?(map: Map) {
        
    }
    
    init(){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        appearance <- map["appearance"]
        powerstats <- map["powerstats"]
        image <- map["image"]
    }
    
    var response:String?
    var id:String?
    var name: String?
    var appearance: Appearance = Appearance()
    var powerstats: Powerstats = Powerstats()
    var image: Image = Image()
    var image2 : UIImage?
    
}

struct Appearance:Mappable {
    var gender:String?
      var race: String?
    init(){
        
    }
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        gender <- map["gender"]
        race <- map["race"]
    }
    
  

}

struct Powerstats :Mappable {
    init(){
        
    }
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        intelligence <- map["intelligence"]
        strength <- map["strength"]
        speed <- map["speed"]
        durability <- map["durability"]
        power <- map ["power"]
        combat <- map["combat"]
    }
    
    var intelligence:String?
    var strength: String?
    var speed:String?
    var durability: String?
    var power:String?
    var combat:String?
    
}

struct Image :Mappable{
    init(){
       
    }
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        image <- map["url"]
    }
    
    var image: String?
}
