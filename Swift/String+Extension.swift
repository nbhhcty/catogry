//
//  String+Extension.swift
//  BaseFoundation
//
//  Created by wsk on 2018/5/5.
//  Copyright © 2018年 wsk. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift

extension String {
    func appVersion() -> String {
        guard let dic = Bundle.main.infoDictionary,
            let version = dic["CFBundleShortVersionString"] as? String else {
            return ""
        }
        return version
    }
}


class test: NSObject {
    func test() {
        let tv1 = UITextField.init(frame: .zero)
        tv1.reactive.continuousTextValues.observeValues { (text) in
            
        }
    }
//    let tv1 = UITextField(frame: CGRect(x: 50, y: 50, width: 200, height: 30))
//    tv1.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
//    tv1.placeholder = "用户名"
//    view.addSubview(tv1)
//
//    tv1.rac_textSignal().subscribeNext { (text) in
//    print(text)
//    }
}
