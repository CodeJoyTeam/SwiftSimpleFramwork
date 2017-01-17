//
//  RootTabBarController.swift
//  SwiftDemo
//
//  Created by zhoutong on 16/11/18.
//  Copyright © 2016年 zhoutong. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
extension RootTabBarController{
    func configureItems() {
        
        
        let firstVC  = BaseNavigationController(rootViewController: FistViewController())
        let item1 : UITabBarItem = UITabBarItem (title: nil, image: UIImage(named: "tab_home_normal"), selectedImage: UIImage(named: "tab_home_selected"))
        firstVC.tabBarItem = item1

        let secondVC = BaseNavigationController(rootViewController: SecondViewController())
        let item2 : UITabBarItem = UITabBarItem (title: "第二页面", image: UIImage(named: "tab_find_normal"), selectedImage: UIImage(named: "tab_find_selected"))
       
        
        
        secondVC.tabBarItem = item2
        
        let thirdVC = BaseNavigationController(rootViewController: ThirdViewController())
        let item3 : UITabBarItem = UITabBarItem (title: "第三页面", image: UIImage(named: "tab_cart_normal"), selectedImage: UIImage(named: "tab_cart_selected"))
        thirdVC.tabBarItem = item3
        
        let fourthVC = BaseNavigationController(rootViewController: FourthViewController())
        let item4 : UITabBarItem = UITabBarItem (title: "第四页面", image: UIImage(named: "tab_user_normal"), selectedImage: UIImage(named: "tab_user_selected"))
        fourthVC.tabBarItem = item4
        
        let tabArray = [firstVC,secondVC,thirdVC,fourthVC]
        self.viewControllers = tabArray
    }
}
