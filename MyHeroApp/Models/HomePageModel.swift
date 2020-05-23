//
//  HomePageModel.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 21/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HomePageModel {
    let heroServices = HeroServices()
    
    func SearchHeros(id:Int, completion: @escaping (Hero?) -> Void){
        heroServices.SearchHeros(id: id) { response in
            if(response != nil){
                if(response?.image.image != nil){
                    let url = URL(string: response!.image.image!)
                    let dataurl = try? Data(contentsOf: url!)
                    if dataurl != nil{
                        response?.image2 = UIImage(data: dataurl!)
                    }
                }
                
               completion(response)
            }else{
               completion(nil)
           }
        }
    }
    
    func SearchHeroByName(name:String, completion: @escaping (HeroList?) -> Void){
         heroServices.SearchHeroByName(name: name) { response in
             if(response != nil){
                if(response!.heros!.count > 0)
                {
                    for index in 0...((response!.heros!.count - 1)){
                        if(response?.heros![index].image != nil){
                            let url = URL(string: (response?.heros![index].image.image!)!)
                            let dataurl = try? Data(contentsOf: url!)
                            if dataurl != nil{
                                response?.heros![index].image2 = UIImage(data: dataurl!)
                            }
                        }
                    }
                }
                completion(response)
             }else{
                completion(nil)
            }
         }
     }
}
