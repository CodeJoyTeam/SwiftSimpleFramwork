//
//  RegexHelper.swift
//  SwiftDemo
//
//  Created by zhoutong on 2017/1/4.
//  Base on Aerolitec Template
//  Copyright © 2017年 zhoutong. All rights reserved.
//

//正则表达式工具

import Foundation

struct RegexHelper {
    let regex:NSRegularExpression
    
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern:pattern,options:.caseInsensitive)
    }
    
    func match(_ input:String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0,input.utf16.count))
        return matches.count > 0
    }
    
}
