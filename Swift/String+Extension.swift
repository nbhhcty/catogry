//
//  String+Extension.swift
//  BaseFoundation
//
//  Created by wsk on 2018/5/5.
//  Copyright © 2018年 wsk. All rights reserved.
//

import Foundation
import UIKit


extension String {
    static func appVersion() -> String? {
        guard let dic = Bundle.main.infoDictionary,
            let version = dic["CFBundleShortVersionString"] as? String else {
            return nil
        }
        return version
    }
    
    static func currentLanguage() -> String? {
        guard let language = NSLocale.preferredLanguages.first else {
            return nil
        }
        return language
    }
    
    static func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    // App沙盒路径
    static func kAppPath() -> String {
        return NSHomeDirectory()
    }
    
    // Documents路径
    static func kBundleDocumentPath() -> String? {
        guard let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            return nil
        }
        return path
    }
    
    // Caches路径
    static func KCachesPath() -> String? {
        guard let path: String = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else {
            return nil
        }
        return path
    }
    
    /// base64编码
    ///
    /// - Parameter options:
    /// - Returns:
    public func base64EncodedString(options: Data.Base64EncodingOptions = []) -> String? {
        let data = self.data(using: .utf8)
        return data?.base64EncodedString(options: options)
    }
    
    /// base64解码
    ///
    /// - Parameter options:
    /// - Returns:
    public func base64DecodedString(options: Data.Base64DecodingOptions = []) -> String? {
        guard let data = Data(base64Encoded: self, options: options) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    public func size(with font: UIFont, toSize: CGSize = CGSize.zero,
                     option: NSStringDrawingOptions = .usesLineFragmentOrigin) -> CGSize {
        let attributes = [NSFontAttributeName: font]
        if __CGSizeEqualToSize(toSize, CGSize.zero) {
            return self.size(attributes:attributes)
        }
        return self.boundingRect(with: toSize, options: option, attributes: attributes, context: nil).size
    }
}
