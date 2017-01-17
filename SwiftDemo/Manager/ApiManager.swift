//
//  ApiManager.swift
//  SwiftDemo
//
//  Created by zhoutong on 2017/1/4.
//  Copyright © 2017年 zhoutong. All rights reserved.
//

import Foundation


private let obj = ApiManager()

class ApiManager{
    class var sharedInstance : ApiManager {
        return obj
    }
}
extension ApiManager{
    func getListData(success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        NetworkTool.sharedInstance.getRequest(urlString: Url.get_listdata, success: { (value) in
            success(value)
        }) { (error) in
            failture(error)
        }
    }
}
