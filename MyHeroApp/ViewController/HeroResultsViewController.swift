//
//  HeroResultsViewController.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 22/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HeroResultsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var heroList:[Hero] = [Hero]();
    override func viewDidLoad() {
        super.viewDidLoad()
        heroList = HomePage.heroResults
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroResultsTableCell", for: indexPath) as! HeroResultsTableCell

        cell.lblNameHero.text = heroList[indexPath.row].name
        cell.imgHero.image = heroList[indexPath.row].image2
        cell.lblRaceHero.text = heroList[indexPath.row].appearance.race
        cell.lblGenderHero.text = heroList[indexPath.row].appearance.gender
        cell.lblNumberHero.text = heroList[indexPath.row].id
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        HomePage.heroSelected = heroList[indexPath.row]
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "HeroDetailsPage") as! HeroDetailsPage
        self.present(viewController,animated: true,completion: nil)
    }
    
    
}
