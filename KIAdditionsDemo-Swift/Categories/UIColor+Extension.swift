//
//  UIColor+Extension.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import UIKit

@objc extension UIColor {
    // HEX COLOR
    public convenience init(hexString: String, alpha: CGFloat = 1) {
        var cStr = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
         //默认值
        if cStr.count < 6 {
            cStr = "#000000"
        }
        
        if cStr.hasPrefix("0x") ||  cStr.hasPrefix("0X"){
            let index = cStr.index(cStr.startIndex, offsetBy: 2)
            cStr = String(cStr[index ..< cStr.endIndex])
        }
        
        if cStr.hasPrefix("#") {
            var index = cStr.index(of: "#")
            index = cStr.index(index!, offsetBy: 1)
            cStr = String(cStr[index! ..< cStr.endIndex])
        }
        //默认值
        if cStr.count != 6 {
            cStr = "000000"
        }
        var index = cStr.index(cStr.startIndex, offsetBy: 2)
        let red = cStr[cStr.startIndex ..< index]
        
        let endIndex = cStr.index(index, offsetBy: 2)
        let green = cStr[index ..< endIndex]
        
        index = cStr.index(index, offsetBy: 2)
        let blue = cStr[index ..< cStr.endIndex]
        var  r = UInt32()
        var  g = UInt32()
        var  b = UInt32()
        Scanner.init(string: String(red)).scanHexInt32(&r)
        Scanner.init(string: String(green)).scanHexInt32(&g)
        Scanner.init(string: String(blue)).scanHexInt32(&b)
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue:CGFloat(b)/255.0, alpha: alpha)
    }
    
    class func colorWithHexString(_ hexStr: String, _ alpha: CGFloat = 1) -> UIColor  {
        return UIColor.init(hexString: hexStr, alpha: alpha)
    }
    
    // 根据color生成图片
    func colorImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

