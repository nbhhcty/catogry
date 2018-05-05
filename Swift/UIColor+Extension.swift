//
//  UIColor+Extension.swift
//  BaseFoundation
//
//  Created by wsk on 2018/5/5.
//  Copyright © 2018年 wsk. All rights reserved.
//

import UIKit

//主题色
public let THEME_COLOR=UIColor(red: 33/255.0, green: 41/255.0, blue: 54/255.0, alpha: 1.0)
//背景色
public let BG_COLOR=UIColor(red: 246/225.0, green: 246/225.0, blue: 246/225.0, alpha: 1.0)
//分割线颜色
public let LINE_COLOR=UIColor(red: 217/225.0, green: 217/225.0, blue: 217/225.0, alpha: 1.0)

/*********尺寸***********/

//设备屏幕尺寸
public let SCREEN_WIDTH=UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT=UIScreen.main.bounds.size.height

// MARK: 通过16进制初始化UIColor
public extension UIColor {
    
    public convenience init(numberColor: Int, alpha: CGFloat = 1.0) {
        self.init(hexColor: String(numberColor, radix: 16), alpha: alpha)
    }
    
    public convenience init(hexColor: String, alpha: CGFloat = 1.0) {
        var hex = hexColor.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        if hex.hasPrefix("0x") || hex.hasPrefix(("0X")) {
            hex.removeSubrange((hex.startIndex ..< hex.index(hex.startIndex, offsetBy: 2)))
        }
        
        guard let hexNum = Int(hex, radix: 16) else {
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
            return
        }
        switch hex.count {
        case 3:
            self.init(red: CGFloat(((hexNum & 0xF00) >> 8).duplicate4bits) / 255.0,
                      green: CGFloat(((hexNum & 0x0F0) >> 4).duplicate4bits) / 255.0,
                      blue: CGFloat((hexNum & 0x00F).duplicate4bits) / 255.0,
                      alpha: alpha)
        case 6:
            self.init(red: CGFloat((hexNum & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((hexNum & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat((hexNum & 0x0000FF) >> 0) / 255.0,
                      alpha: alpha)
        default:
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        }
    }
    
    static func fromeHex(_ hex: Int, _ a: Int) -> UIColor {
        return UIColor.init(red: CGFloat(((Float)((hex & 0xFF0000) >> 16))/255.0),
                            green: CGFloat(((Float)((hex & 0x00FF00) >>  8))/255.0),
                            blue: CGFloat(((Float)((hex & 0x0000FF) >>  0))/255.0),
                            alpha: CGFloat(a))
    }
}

private extension Int {
    var duplicate4bits: Int {
        return self << 4 + self
    }
}
