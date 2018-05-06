//
//  CGFloat+Extension.swift
//  BaseFoundation
//
//  Created by wsk on 2018/5/5.
//  Copyright © 2018年 wsk. All rights reserved.

import CoreGraphics

let π = CGFloat(Double.pi)

public extension CGFloat {
    
    var toInt : Int {
        return Int(self)
    }
    
    var toDouble : Double {
        return Double(self)
    }
    
    var toFloat : Float {
        return Float(self)
    }
    
    /// 角度转弧度
    /// - In: 180°
    /// - Returns: π
    public func degreesToRadians() -> CGFloat {
        return π * self / 180.0
    }
    
    /// 弧度转角度
    /// - In: π
    /// - Returns: 180°
    public func radiansToDegrees() -> CGFloat {
        return self * 180.0 / π
    }
    
    /// 确保浮动值保持在给定值之间
    ///
    ///   - In: 1.2
    ///   - v1: 1.1
    ///   - v2: 1.3
    /// - Returns: 1.2
    public func clamped(_ v1: CGFloat, _ v2: CGFloat) -> CGFloat {
        let min = v1 < v2 ? v1 : v2
        let max = v1 > v2 ? v1 : v2
        return self < min ? min : (self > max ? max : self)
    }
    
    /// 确保浮动值保持在给定值之间
    ///
    ///   - In: 0.9 -> 1.1
    ///   - v1: 1.1
    ///   - v2: 1.3
    /// - Returns: 1.1
    public mutating func clamp(_ v1: CGFloat, _ v2: CGFloat) -> CGFloat {
        self = clamped(v1, v2)
        return self
    }
    
    /// 返回随机百分比
    ///
    /// - Returns: 0 ~ 1
    public static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
}

extension Int {
    // 给Int类型添加一个下标，该下标表示十进制数从右向左的第n个数字。    
    // 746381295[0] 5
    // 746381295[1] 9
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}




