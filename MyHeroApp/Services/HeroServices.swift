//
//  HeroServices.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 21/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
class HeroServices {
    let baseURL = "https://superheroapi.com/api/"
    let apiKey = "3304412732904269/"
    
    
    func SearchHeros(id:Int,  completion: @escaping (Hero?) -> Void){
        Alamofire.request(baseURL+apiKey+id.description)
            .responseObject { (response: DataResponse<Hero>) in
            switch(response.result) {
           case .success(_):
            let data = response.result.value
               completion(data)
                return
            case .failure(_):
                completion(nil)
                return
            }
        }
    }
    
    func SearchHeroByName(name:String,  completion: @escaping (HeroList?) -> Void){
        Alamofire.request(baseURL+apiKey+"search/"+name)
            .responseObject { (response: DataResponse<HeroList>) in
            switch(response.result) {
           case .success(_):
            let data = response.result.value
            completion(data ?? HeroList())
                return
            case .failure(_):
                completion(nil)
                return
            }
        }
    }
}
