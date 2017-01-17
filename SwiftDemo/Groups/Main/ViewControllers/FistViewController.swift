//
//  FistViewController.swift
//  SwiftDemo
//
//  Created by zhoutong on 16/11/18.
//  Copyright © 2016年 zhoutong. All rights reserved.
//

import UIKit


enum SystemLocationManagerStatus {
    case Success          ///成功
    case Authorization    ///未获取到授权
    case NoService        ///未开通服务
    case Network          ///网络原因
    case Other            ///其他
}

class FistViewController: BaseViewController {

    override func viewDidLoad() {
      
        
        
        super.viewDidLoad()
        self.title = "第一页面"
        self.view.addSubview(self.testButton)
        
//        var  `self` :String = "aaa"
//    
//        
//        var possibleString: String? = ""
//        possibleString = nil
//        possibleString = possibleString! + "aaa"
////        possibleString = "xxx"
//        print(possibleString) // possibleString 为可选变量，需要使用!来访问的值
//        print(possibleString)
    }
    override func layoutPageSubViews() {
        self.testButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.left.equalTo(self.view).offset(100)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    lazy var testButton:UIButton = {
        let _testButton = UIButton.init(type: UIButtonType.custom)
        _testButton.backgroundColor = UIColor.lightGray
        _testButton.setTitle("test", for: UIControlState.normal)
        _testButton.addTarget(self, action: #selector(testButtonAction), for: UIControlEvents.touchUpInside)
        return _testButton
    }()
    
}
extension FistViewController{

    func testButtonAction()  {
        let listVC = ListViewController()
        listVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(listVC, animated: true)
      
        
    }
    func test(
        input2: (
        username: String,
        password: String
        
        ),
        dependency: (
        username: String,
        password: String
        )
        ){
     
    }
    
}

enum WeekDay {
    
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
    
}
enum WeekDayWithRaw : String {
    
    case Monday = "1. Monday"
    case Tuesday = "2. Tuesday"
    case Wednesday = "3. Wednesday"
    case Thursday = "4. Thursday"
    case Friday = "5. Friday"
    case Saturday = "6. Saturday"
    case Sunday = "7. Sunday"
    
}

class MyOptions {
    
    class var None   : UInt32 { return 0 }
    
    class var All    : UInt32 { return UInt32.max }
    
    class var First  : UInt32 { return 1 }
    
    class var Second : UInt32 { return 1<<1 }
    
    class var Third  : UInt32 { return 1<<2 }
    
    class var Forth :UInt32 {return Second | Third}
    
}




