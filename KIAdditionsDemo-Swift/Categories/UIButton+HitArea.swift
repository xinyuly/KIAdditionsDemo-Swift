//
//  UIButton+HitArea.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//  扩展button的响应域

import UIKit

var KEY_HIT_TEST_EDGE_INSETS = "KEY_HIT_TEST_EDGE_INSETS"

//MARK: --扩展button的响应域
extension UIButton {
    
    var hitTestEdgeInsets: UIEdgeInsets? {
        get {
            let value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS)
            if value != nil {
                return (value as? UIEdgeInsets)!
            } else {
                return .zero
            }
        }
        set (newValue) {
            objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if hitTestEdgeInsets == .zero || !self.isEnabled || self.isHidden {
            return super.point(inside: point, with: event)
        }
        let relativeFrame = self.bounds
        let hitFrame = relativeFrame.inset(by: self.hitTestEdgeInsets!)
        let bool = hitFrame.contains(point)
    
        return bool
    }
}

//MARK: --增加点击后转菊花效果
extension UIButton {
    
    @discardableResult
    func showIndicatorView() -> UIActivityIndicatorView {
        let activity = UIActivityIndicatorView.init(style:.white)
        activity.hidesWhenStopped = true
        self.addSubview(activity)
        activity.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        activity.startAnimating()
        return activity
    }
    
    func dismissIndicatorView() {
        for view in self.subviews {
            if view.isKind(of: UIActivityIndicatorView.self) {
                let activity  = view as! UIActivityIndicatorView
                activity.stopAnimating()
                activity.removeFromSuperview()
                return
            }
        }
    }
}
