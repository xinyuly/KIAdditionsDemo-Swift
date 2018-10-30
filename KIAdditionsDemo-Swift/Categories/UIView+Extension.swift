//
//  UIView+Extension.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import UIKit

//MARK: - frame
extension UIView {

    public var  x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.x = origin.x
            self.y = origin.y
        }
    }
    
    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    public var rightX: CGFloat {
        get {
            return self.x + self.width
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue - frame.size.width
            self.frame = frame
        }
    }
    
    public var bottomY: CGFloat {
        get {
            return self.y + self.height
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue - frame.size.height
            self.frame = frame
        }
    }
    
    public var viewCenter: CGPoint {
        get {
            return CGPoint(x: self.width / 2.0, y: self.height / 2.0)
        }
    }
}

//MARK: - layer相关
extension UIView {
    
    func setCornerRadius(_ radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setBorderWidth(_ width:CGFloat) {
        self.layer.borderWidth = width
    }
    
    func setBorderWidth(_ width:CGFloat, borderColor:UIColor?) {
        self.layer.borderWidth = width
        self.layer.borderColor = borderColor?.cgColor
    }

    /// 贝塞尔曲线加圆角，必须提供当前view的rect，可以单独给某个边加
    ///
    /// - Parameters:
    ///   - roundedRect:当前view的rect
    ///   - byRoundingCorners: 需要给某个角加，例如[.topLeft,.topRight,.bottomRight]
    ///   - cornerRadii: 圆角的大小
    func addBezierCorner(byRoundingCorners:UIRectCorner, cornerRadius: CGFloat) {
        let maskPath: UIBezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: byRoundingCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    /// 周边加阴影，并且同时圆角
    ///
    /// - Parameters:
    ///   - shadowOpacity: 阴影透明度
    ///   - shadowRadius: 阴影半径
    func addShadowToView(shadowOpacity:Float,shadowRadius:CGFloat,cornerRadius:CGFloat) {
        //////// shadow /////////
        let shadowLayer = CALayer()
        shadowLayer.frame = self.frame
        shadowLayer.shadowColor = UIColor.gray.cgColor //shadowColor阴影颜色
        //shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
        shadowLayer.shadowOffset = CGSize(width: shadowRadius, height: shadowRadius)
        shadowLayer.shadowOpacity = shadowOpacity//0.8;//阴影透明度，默认0
        shadowLayer.shadowRadius = shadowRadius//阴影半径，默认3
        shadowLayer.backgroundColor = UIColor.gray.cgColor
        shadowLayer.cornerRadius = cornerRadius
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.superview?.layer.insertSublayer(shadowLayer, below: self.layer)
    }
}
//MARK: - view 添加点击事件
extension UIView {
   
    func addTapAction(selector: Selector, target: Any?) {
        self.isUserInteractionEnabled = true
        let tapGes: UITapGestureRecognizer = UITapGestureRecognizer(target: target, action: selector)
        self.addGestureRecognizer(tapGes)
    }
}
