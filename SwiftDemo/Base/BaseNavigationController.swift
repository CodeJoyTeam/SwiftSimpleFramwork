//
//  BaseNavigationController.swift
//  SwiftDemo
//
//  Created by zhoutong on 16/11/18.
//  Copyright © 2016年 zhoutong. All rights reserved.
//

import UIKit

open class BaseNavigationController: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //背景颜色
        UINavigationBar.appearance().barTintColor = UIColor.orange
        //文字颜色
        let textAttr = [ NSForegroundColorAttributeName: UIColor.white ]
        UINavigationBar.appearance().titleTextAttributes = textAttr
        //手势返回相关
        self.interactivePopGestureRecognizer?.delegate = self
    }

}
//手势返回相关
extension BaseNavigationController:UINavigationControllerDelegate,UIGestureRecognizerDelegate{
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        self.interactivePopGestureRecognizer?.isEnabled = true
    }
}
