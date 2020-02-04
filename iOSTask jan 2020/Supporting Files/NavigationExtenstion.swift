//
//  NavigationExtenstion.swift
//  iOSTask jan 2020
//
//  Created by MONU on 2/3/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController{

    func backBarLeft() {
        self.navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "#56BCCA")
        navigationItem.hidesBackButton = true
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "backarrow"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(action_Back1), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.setLeftBarButtonItems([item1], animated: true)
    }
    
    func addNavigationBarLeft(titleName:String) {
        self.navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "#56BCCA")
        navigationItem.hidesBackButton = true
        self.title = titleName
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "menu_icon"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(action_Back), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.setLeftBarButtonItems([item1], animated: true)
    }
    
    @objc func action_Back() {
       // sideMenuManager?.toggleSideMenuView()
    }
    
    @objc func action_Back1() {
        self.navigationController?.popViewController(animated: true)
    }
    

}



func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
//    if ((cString.characters.count) != 6) {
//        return UIColor.gray
//    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
