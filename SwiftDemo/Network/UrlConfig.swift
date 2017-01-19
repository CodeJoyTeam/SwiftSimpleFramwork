//
//  UrlConfig.swift
//  SwiftDemo
//
//  Created by zhoutong on 2017/1/3.
//  Copyright © 2017年 zhoutong. All rights reserved.
//

import Foundation

struct Url {
    
    #if DEBUG
        static let baseUrl:String = "http://capi.douyucdn.cn/"   //测试环境
    #else
        static let baseUrl:String = "http://capi.douyucdn.cn/"   //正式环境
    #endif
    
    
    static let get_listdata:String = baseUrl + "api/v1/getVerticalRoom?aid=ios&client_sys=ios&limit=10&offset=0&auth=c267b5f2a46ca11dbb8969ab3699eaf9&time="
    
    
}
