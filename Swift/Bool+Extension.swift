//
//  Bool+Extension.swift
//  BaseFoundation
//
//  Created by wsk on 2018/5/5.
//  Copyright © 2018年 wsk. All rights reserved.
//

import Foundation
import UIKit


// MARK: - Device
public extension Bool {
    
    public static var isIphone: Bool {
        return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
    }
    
    public static var iphone_568: Bool {
        return isIphone && max(UIScreen.width, UIScreen.height) == 568.0
    }
    
    public static var iphone_568_or_less: Bool {
        return isIphone && max(UIScreen.width, UIScreen.height) < 568.0
    }
    
    public static var iphone_667: Bool {
        return isIphone && max(UIScreen.width, UIScreen.height) == 667.0
    }
    
    public static var iphone_667_or_less: Bool {
        return isIphone && max(UIScreen.width, UIScreen.height) < 667.0
    }
    
    public static var iphone_736: Bool {
        return isIphone && max(UIScreen.width, UIScreen.height) == 736.0
    }
    
    public static var iphone_736_or_less: Bool {
        return isIphone && max(UIScreen.width, UIScreen.height) < 736.0
    }
}

// MARK: - Orientation
public extension Bool {
    
    public static var isPortrait: Bool {
        return UIApplication.shared.statusBarOrientation == .portrait
    }
    
    public static var isPortraitUpsideDown: Bool {
        return UIApplication.shared.statusBarOrientation == .portraitUpsideDown
    }
    
    public static var isLandscapeLeft: Bool {
        return UIApplication.shared.statusBarOrientation == .landscapeLeft
    }
    
    public static var isLandscapeRight: Bool {
        return UIApplication.shared.statusBarOrientation == .landscapeRight
    }
}

