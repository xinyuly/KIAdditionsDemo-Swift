//
//  MBProgressHUD+Hud.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import Foundation
import MBProgressHUD

extension MBProgressHUD {

    /// 展示GIF格式
    @discardableResult
    class func showGif(to view: UIView?) -> MBProgressHUD {
        var  newView = view
        if newView  == nil {
            newView = (UIApplication.shared.delegate?.window)!
        }
        let hud = MBProgressHUD.showAdded(to: newView!, animated: true)
        hud.mode = .customView
        
        let imageView = UIImageView(image: UIImage(named: "icon_loading"))
        
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        hud.customView = imageView
        hud.minSize = CGSize(width: 40, height: 40)
        //去掉背景色
        hud.bezelView.style = .solidColor
        hud.bezelView.backgroundColor = UIColor.clear
        hud.label.text = "正在为你准备。。。"
        hud.label.textColor = UIColor.black
        return hud
    }
    
    @discardableResult
    class func showMessage(_ message: String,toview: UIView?,afterDelay seconds:Int = 0) -> MBProgressHUD {
        var  newView = toview
        if newView  == nil {
            newView = (UIApplication.shared.delegate?.window)!
        }
        let hud = MBProgressHUD.showAdded(to: newView!, animated: true)
        hud.mode = .text
        hud.label.text = message
        hud.label.font = UIFont.systemFont(ofSize: 15)
        hud.label.numberOfLines = 0
        if  (seconds > 0) {
            hud.hide(animated: true, afterDelay: TimeInterval(seconds))
        } else {
            hud.show(animated: true)
        }
        return hud
    }
    
    //显示菊花动画
    @discardableResult
    class func show(toview: UIView?) -> MBProgressHUD {
        var  newView = toview
        if newView  == nil {
            newView = (UIApplication.shared.delegate?.window)!
        }
        let hud = MBProgressHUD.showAdded(to: newView!, animated: true)
        hud.bezelView.style = .solidColor
        hud.bezelView.backgroundColor = UIColor.clear
        hud.show(animated: true)
        return hud
    }
}
