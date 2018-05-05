//
//  StringExtensionTest.swift
//  BaseFoundation
//
//  Created by wsk on 2018/5/5.
//  Copyright © 2018年 wsk. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

class StringExtensionTest: NSObject {
    override init() {
        super.init()
        print("appVersion = \(String.appVersion())")
        print("currentLanguage = \(String.currentLanguage())")
        print("systemVersion = \(String.systemVersion())")
        

        var floatValue: CGFloat = 0.9
        print("clamped = \(floatValue.clamped(1.0, 1.2))")
        print("floatValue = \(floatValue)")
        print("clamp = \(floatValue.clamp(1.0, 1.2))")
        print("floatValue = \(floatValue)")
        
        print("CGFloat.random = \(CGFloat.random())")
    }
}
