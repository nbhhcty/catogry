//
//  ResponderViewA.swift
//  BaseFoundation
//
//  Created by wsk on 2018/5/6.
//  Copyright © 2018年 wsk. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ResponderBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let name = UILabel.init(frame: .zero)
        name.text = self.className
        self.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return super.hitTest(point, with: event)
    }
}

class ResponderViewA: ResponderBaseView {
    @objc func view1TapAction() -> Void {
        print("view1TapAction")
    }
    
    @objc func view2TapAction() -> Void {
        print("view2TapAction")
    }
    
    lazy var view1: ResponderViewA_1 = {
        let obj = ResponderViewA_1.init(frame: .zero)
        obj.addTapGestureRecognizer(#selector(view1TapAction), target: self)
        obj.backgroundColor = UIColor.init(numberColor: 0xff0000, alpha: 1)
        self.addSubview(obj)
        return obj
    }()
    
    lazy var view2: ResponderViewA_2 = {
        let obj = ResponderViewA_2.init(frame: .zero)
        obj.addTapGestureRecognizer(#selector(view2TapAction), target: self)
        obj.backgroundColor = UIColor.init(numberColor: 0x11ff00, alpha: 1)
        self.addSubview(obj)
        return obj
    }()
    
    override func updateConstraints() {
        super.updateConstraints()
        self.view1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(4)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        self.view2.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-4)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("ResponderViewA point = \(point)")
        
        /// 所有的时间都让view2响应
        return self.view2
    }
}

class ResponderViewB: ResponderBaseView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("ResponderViewB point = \(point)")
        return super.hitTest(point, with: event)
    }
}

class ResponderViewA_1: ResponderBaseView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("ResponderViewA_1 point = \(point)")
        return super.hitTest(point, with: event)
    }
}

class ResponderViewA_2: ResponderBaseView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("ResponderViewA_2 point = \(point)")
        return super.hitTest(point, with: event)
    }
}
