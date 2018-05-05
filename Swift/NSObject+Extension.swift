//
//  NSObject+Extension.swift
//  BaseFoundation
//
//  Created by wsk on 2018/5/5.
//  Copyright © 2018年 wsk. All rights reserved.
//

import Foundation

public extension NSObject {
    
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return stringFromClass(aClass: self)
    }
}

func stringFromClass(aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).components(separatedBy: ".").last!
}
