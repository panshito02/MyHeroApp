//
//  ViewController.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 21/05/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HomePage: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    var ids: Int =  6
    var idstable = 11
    var loadingCollection: Bool = false
    var loadingTable: Bool = false
    public static var heroSelected: Hero = Hero()
    public static var heroResults:[Hero] = [Hero]()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var viewAvatar: UIView!
    @IBOutlet weak var viewHeroTable: UITableView!
    var _heroList = [Hero]()
    var _heroList2 = [Hero]()
    @IBOutlet weak var avatarColecctionView: UICollectionView!
    let homePageModel = HomePageModel();
    let indicator = Indicator()
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHeros()
        prepareViewAvatar()
        
        searchBar.showsScopeBar = true
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       indicator.showActivityIndicator(uiView: self.view)
        homePageModel.SearchHeroByName(name:searchBar.text!){response in
            if(response?.heros != nil)
            {
                self.indicator.hideActivityIndicator(uiView: self.view)
                HomePage.heroResults = response?.heros! as! [Hero]
                let viewController = self.storyboard!.instantiateViewController(withIdentifier: "HeroResultsViewController") as! HeroResultsViewController
                self.present(viewController,animated: true,completion: nil)
            }
        }
        
        
    }

    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        _heroList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        
        cell.lblNameHero.text = _heroList[indexPath.row].name
        cell.imgHero.image = _heroList[indexPath.row].image2
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        HomePage.heroSelected = _heroList[indexPath.row]
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "HeroDetailsPage") as! HeroDetailsPage
        self.present(viewController,animated: true,completion: nil)
     }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        _heroList2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTableCell", for: indexPath) as! HomePageTableCell
        

        cell.lblNameHero.text = _heroList2[indexPath.row].name
        cell.imgHero.image = _heroList2[indexPath.row].image2
        cell.lblRaceHero.text = _heroList2[indexPath.row].appearance.race
        cell.lblGenderHero.text = _heroList2[indexPath.row].appearance.gender
        cell.lblNumberHero.text = _heroList2[indexPath.row].id
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        HomePage.heroSelected = _heroList2[indexPath.row]
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "HeroDetailsPage") as! HeroDetailsPage
        self.present(viewController,animated: true,completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (scrollView.contentOffset.y >= CGFloat(_heroList2.count * 75 ) && loadingTable == false) {
            addItemsTableView(){ response in self.loadingTable = false}
            loadingTable = true
         }
        
        if(scrollView.contentOffset.x >= CGFloat(_heroList.count * 50 ) && loadingCollection == false){
            addItemsCollectionView(){response in self.loadingCollection = false}
            loadingTable = true
        }
    }
    
    func initializeHeros(){
        
        addItemsTableView(){ response in
            if(response){
                self.addItemsCollectionView(){response in}
            }
        }
    }
    
    func addItemsCollectionView(completion: @escaping (Bool) -> Void){
        for index in ids-5...ids{
            homePageModel.SearchHeros(id: index){ response in
                
                if(response?.id != nil){
                    self._heroList.append(response!)
                    self.avatarColecctionView.reloadData()
                    if(index == self.ids){
                        completion(true)
                        self.ids += 5
                    }
                }
                  
              }
          }
    }
    
    func addItemsTableView(completion: @escaping (Bool) -> Void){
        for index in idstable-10...idstable{
            homePageModel.SearchHeros(id: index){ response in
                if(response?.id != nil)
                {
                    self._heroList2.append(response!)
                    self.viewHeroTable.reloadData()
                    if(index == self.idstable){
                        completion(true)
                        self.idstable += 10
                    }
                }
              }
          }
        
        
    }
    
    func prepareViewAvatar(){
            viewAvatar.layer.shadowColor = UIColor(red:0/255.0, green: 0/255.0 ,blue: 0/255.0,alpha: 1.0).cgColor
            viewAvatar.layer.borderColor = UIColor(red:255/255.0, green: 255/255.0 ,blue: 255/255.0,alpha:1.0).cgColor
            viewAvatar.layer.shadowOffset = CGSize(width:0, height:1.75)
            viewAvatar.layer.shadowRadius = 1.75
            viewAvatar.layer.shadowOpacity = 0.9
            viewAvatar.layer.cornerRadius = 9
        }

    


}

