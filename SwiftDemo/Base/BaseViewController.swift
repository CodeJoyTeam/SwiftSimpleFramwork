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
        setLeftButton()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layoutPageSubViews()
    }
    //MARK:-----属性-----
    lazy var HUDView: UIActivityIndicatorView = {
        let HUDView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        let centerOffset = CGPoint(x: self.view.center.x, y: self.view.center.y-50)
        HUDView.center = centerOffset
        return HUDView
    }()
}
//布局
extension BaseViewController{
    func layoutPageSubViews(){
        
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
    
    //设置返回按钮
    func setLeftButton(){
        //判断如果不是根视图
        if((self.navigationController?.childViewControllers.count)! > 1){
            let leftBarBtn = UIBarButtonItem(title: nil, style: .plain, target: self,
                                             action: #selector(leftButtonAction))
            leftBarBtn.image = UIImage(named: "button_back")
            //用于消除左边空隙，要不然按钮顶不到最前面
            let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            spacer.width = -10;
            self.navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
        }

    }
    func leftButtonAction(){
        _ = self.navigationController?.popViewController(animated: true)
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
//网络加载 菊花
extension BaseViewController{
    func initLoadingView() {
        HUDView.startAnimating()
    }
    func removeLoadingView() {
        HUDView.stopAnimating()
    }
}

