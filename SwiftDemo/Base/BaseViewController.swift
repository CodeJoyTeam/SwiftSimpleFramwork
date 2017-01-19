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

//nav bar  按钮
extension BaseViewController{

    
    //右边按钮  纯文字
    func setRightButton(title:String){
        let btn=UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        btn.setTitle(title, for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.setTitleColor(UIColor.lightGray, for: UIControlState.highlighted)
        btn.addTarget(self, action: #selector(rightButtonAction), for: UIControlEvents.touchUpInside)
        
        let item=UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem=item
    }
    //右边按钮 图片
    func setRightButton(imgName:String){
        let img=UIImage(named: imgName)
        
        let item=UIBarButtonItem(image: img, style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightButtonAction))
        self.navigationItem.rightBarButtonItem=item
    }
   
    
    func rightButtonAction() {
        DLog(message: "right button")
    }
    func layoutPageSubViews()  {
        
    }
    
}
//简单的alert
extension BaseViewController{
    
    func alert(title:String,msg:String){
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        //        alertVC.addTextField { (tField:UITextField!) -> Void in
        //            tField.placeholder = "Account"
        //        }
        //        let acOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (alertAction:UIAlertAction!) -> Void in
        //        }
        let acCancel = UIAlertAction(title: "确定", style: UIAlertActionStyle.cancel) { (alertAction:UIAlertAction!) -> Void in
        }
        //        acOK.isEnabled = false
        //        alertVC.addAction(acOK)
        alertVC.addAction(acCancel)
        //因为UIAlertController是控制器，所以我们现在得改用控制器弹出
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
