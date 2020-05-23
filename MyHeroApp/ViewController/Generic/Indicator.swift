//
//  Indicator.swift
//  MyHeroApp
//
//  Created by Francisco Higuera Zamarripa on 3/27/20.
//  Copyright © 2020 FranciscoHigueraZamarripa. All rights reserved.
//

import UIKit

class Indicator {
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var chargeLabel: UILabel = UILabel()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    init (){
    
    }

    func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = CGPoint(x: uiView.frame.size.width / 2, y: uiView.frame.size.height / 3);
        container.backgroundColor = .clear
    
        loadingView.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
    
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 90.0, height: 90.0);
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        chargeLabel.frame = CGRect(x: 0.0, y: 0.0, width:loadingView.frame.size.width , height: loadingView.frame.size.height);
        chargeLabel.text = "Cargando"
        chargeLabel.textColor = .white
        chargeLabel.center = CGPoint(x: loadingView.frame.size.width - 40, y: loadingView.frame.size.height - 20);

        loadingView.addSubview(activityIndicator)
        loadingView.addSubview(chargeLabel)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }


}
