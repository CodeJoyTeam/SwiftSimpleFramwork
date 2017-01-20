//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by zhoutong on 16/11/11.
//  Copyright © 2016年 zhoutong. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        let rootVC = RootTabBarController()
        self.window?.rootViewController = rootVC
        
        //播放启动画面动画
       launchAnimation()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        
    }

    
    
   
}
//增加启动动画功能
extension AppDelegate{
    //播放启动画面动画
    fileprivate func launchAnimation() {
        let statusBarOrientation = UIApplication.shared.statusBarOrientation
        if let img = splashImageForOrientation(orientation: statusBarOrientation,
                                               size: (self.window?.bounds.size)!) {
            //获取启动图片
            let launchImage = UIImage(named: img)
            let launchview = UIImageView(frame: UIScreen.main.bounds)
            launchview.image = launchImage
            //将图片添加到视图上
            //self.view.addSubview(launchview)
            let delegate = UIApplication.shared.delegate
            let mainWindow = delegate?.window
            mainWindow!!.addSubview(launchview)
            
            //播放动画效果，完毕后将其移除
            UIView.animate(withDuration: 1, delay: 1.5, options: .beginFromCurrentState,
                           animations: {
                            launchview.alpha = 0.0
                            launchview.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1.0)
            }) { (finished) in
                launchview.removeFromSuperview()
            }
        }
    }
    
    //获取启动图片名（根据设备方向和尺寸）
    func splashImageForOrientation(orientation: UIInterfaceOrientation, size: CGSize) -> String?{
        //获取设备尺寸和方向
        var viewSize = size
        var viewOrientation = "Portrait"
        
        if UIInterfaceOrientationIsLandscape(orientation) {
            viewSize = CGSize(width: size.height, height: size.width)
            viewOrientation = "Landscape"
        }
        
        //遍历资源库中的所有启动图片，找出符合条件的
        if let imagesDict = Bundle.main.infoDictionary  {
            if let imagesArray = imagesDict["UILaunchImages"] as? [[String: String]] {
                for dict in imagesArray {
                    if let sizeString = dict["UILaunchImageSize"],
                        let imageOrientation = dict["UILaunchImageOrientation"] {
                        let imageSize = CGSizeFromString(sizeString)
                        if imageSize.equalTo(viewSize)
                            && viewOrientation == imageOrientation {
                            if let imageName = dict["UILaunchImageName"] {
                                return imageName
                            }
                        }
                    }
                }
            }
        }
        
        return nil
    }
}
