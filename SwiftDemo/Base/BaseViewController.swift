//
//  BaseViewController.swift
//  SwiftDemo
//
//  Created by zhoutong on 16/11/11.
//  Copyright © 2016年 zhoutong. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = .init(rawValue: 0)
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layoutPageSubViews()
    }
    
    
  

}
extension BaseViewController{

    func layoutPageSubViews()  {
        
    }
    
    
    
}
