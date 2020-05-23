//
//  HeroDetailsPage.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 22/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HeroDetailsPage: UIViewController, UITableViewDataSource,UITableViewDelegate{

    
    

    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var lblNameHero: UILabel!
    var descriptionHeroList = [HeroDetails]()
    
    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(HomePage.heroSelected.id != nil)
        {
            PrepareHeader()
            initializeDesciptionList()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptionHeroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroDetailsCell", for: indexPath) as! HeroDetailCell
        cell.lblTitleDescription.text  = descriptionHeroList[indexPath.row].titleDescription
        cell.lblDescription.text = descriptionHeroList[indexPath.row].description
        
         return cell
    }
    
    func initializeDesciptionList(){
        descriptionHeroList.append(HeroDetails(titleDescription:"Number Hero:", description:HomePage.heroSelected.id!))
        descriptionHeroList.append(HeroDetails(titleDescription:"Intelligence:", description:HomePage.heroSelected.powerstats.intelligence!))
        descriptionHeroList.append(HeroDetails(titleDescription:"Power:", description:HomePage.heroSelected.powerstats.power!))
        descriptionHeroList.append(HeroDetails(titleDescription:"Strenght:", description:HomePage.heroSelected.powerstats.strength!))
        descriptionHeroList.append(HeroDetails(titleDescription:"Speed:", description:HomePage.heroSelected.powerstats.speed!))
        descriptionHeroList.append(HeroDetails(titleDescription:"Durability:", description:HomePage.heroSelected.powerstats.durability!))
        descriptionHeroList.append(HeroDetails(titleDescription:"Gender:", description:HomePage.heroSelected.appearance.gender!))
        descriptionHeroList.append(HeroDetails(titleDescription:"Race:", description:HomePage.heroSelected.appearance.race!))
    }
    
    func PrepareHeader(){
        headerView.layer.shadowColor = UIColor(red:0/255.0, green: 0/255.0 ,blue: 0/255.0,alpha: 1.0).cgColor
        headerView.layer.borderColor = UIColor(red:255/255.0, green: 255/255.0 ,blue: 255/255.0,alpha: 1.0).cgColor
        headerView.layer.shadowOffset = CGSize(width:0, height:1.75)
        headerView.layer.shadowRadius = 1.75
        headerView.layer.shadowOpacity = 0.45
       // viewCell.layer.cornerRadius = 9
        
        
        imgHero.image = HomePage.heroSelected.image2!
        lblNameHero.text = HomePage.heroSelected.name!
    }
}
