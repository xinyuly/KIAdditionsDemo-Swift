//
//  String+Extension.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import UIKit

extension String {
    
    /// 除去左右空格
    ///
    /// - Returns: 字符串
    func trimLeftAndRightWhitespace() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// 判断是否是手机号码
    ///
    /// - Returns:
    func isPhoneNumber() -> Bool {
        let phoneRegEx = "^1(3[0-9]|4[0-9]|5[0-9]|7[0-9]|8[0-9])\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return predicate.evaluate(with:self)
    }
    
    //汉字转拼音
    static func chineseTransformPinYin(chinese: NSString) ->NSString {
        let pinyin: NSMutableString = chinese.mutableCopy() as! NSMutableString
        //将汉字转换为拼音(带音标)
        CFStringTransform(pinyin, nil, kCFStringTransformMandarinLatin, false)
        //去掉拼音的音标
        CFStringTransform(pinyin, nil, kCFStringTransformStripCombiningMarks, false)
        
        var newPinyin = ""
        newPinyin = polyphoneStringHandle(aString: chinese as String,pinyin: pinyin.replacingOccurrences(of: " ", with: "") )
        return newPinyin as NSString
    }
    
    //多音字
    static func polyphoneStringHandle(aString:String,pinyin:String)->String {
        var str = pinyin
        if aString.contains("成都") {
            str = "chengdu"
        }
        return str
    }
    
    //判断是否是中文
    static func isChinese(text:String) -> Bool {
        let match = String(format: "(^[\u{4E00}-\u{9FA5}]+$)")
        let predicate = NSPredicate(format: "SELF matches %@", match)
        return predicate.evaluate(with:text)
    }
    
    //计算字符串的高度
    func sizeWithFont(font: UIFont, maxW: CGFloat) ->CGSize {
        let attrs = NSMutableDictionary()
        attrs[kCTFontAttributeName] = font
        let maxSize: CGSize = CGSize(width: maxW, height: CGFloat(MAXFLOAT))
        let tempStr: NSString = self as NSString
        return tempStr.boundingRect(with: maxSize, options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue)), attributes: attrs as? [NSAttributedString.Key : Any], context: nil).size
    }
}
