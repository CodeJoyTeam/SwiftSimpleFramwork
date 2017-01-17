//
//  Global.swift
//  SwiftDemo
//
//  Created by zhoutong on 2017/1/3.
//  Copyright © 2017年 zhoutong. All rights reserved.
//

import UIKit
import Foundation
import SnapKit


let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let iphone5W:CGFloat = 320.0
let iphone6W:CGFloat = 375.0
let iphone6plusW:CGFloat = 414.0


func pxTopt(_ px:CGFloat) -> CGFloat {
    var standardPt = CGFloat(px/2.0)
    if UIDevice.isIPhone5() || UIDevice.isIPhone4() {
        standardPt = (iphone5W/iphone6W)*standardPt
    }else if  UIDevice.isIPhone6Plus(){
        standardPt = (iphone6plusW/iphone6W)*standardPt
    }
    return standardPt
}
/// 打印
func DLog<T>(message : T, file : String = #file, lineNumber : Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):line:\(lineNumber)]- \(message)")
    #endif
}




precedencegroup MatchPrecedence{
    associativity:none
    higherThan:DefaultPrecedence
}
// 判断字符串是否符合正则表达式
infix operator =~: MatchPrecedence
/*
 *  使用示例
 *  if "fanghonghao77@qq.com" =~ "^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+"{
 *       DLog(message: "合法邮箱")
 *  }
 */
func =~(lhs:String,rhs:String)-> Bool{
    do{
        return try RegexHelper(rhs).match(lhs)
    }catch _{
        return false
    }
}

struct Global {
    
}

