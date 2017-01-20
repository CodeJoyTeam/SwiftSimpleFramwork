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
        self.view.addSubview(HUDView)
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.layoutPageSubViews()
    }
    func initLoadingView() {
        HUDView.startAnimating()
    }
    func removeLoadingView() {
        HUDView.stopAnimating()
    }
    func layoutPageSubViews()  {
        
    }
    //MARK:-----属性-----
    lazy var HUDView: UIActivityIndicatorView = {
        let HUDView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        let centerOffset = CGPoint(x: self.view.center.x, y: self.view.center.y-50)
        HUDView.center = centerOffset
        return HUDView
    }()
  

}
extension BaseViewController{
    

}
