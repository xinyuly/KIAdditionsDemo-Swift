//
//  NSBundle+KIAdditions.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import UIKit

extension Bundle {
    
    class func bundlePath() -> String {
        return Bundle.main.bundlePath
    }
    
    class func appHomeDirectory() -> String {
        return NSHomeDirectory()
    }
    
    //MARK: - Bundle相关
    class func bundleIdentifier() -> String {
        return Bundle.main.bundleIdentifier!
    }
    
    class func bundleDisplayName() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }
    
    class func bundleName() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
    }
    
    class func bundleBuildVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
    
    class func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    class func bundleMiniumOSVersion() -> Float {
        return Float(Bundle.main.object(forInfoDictionaryKey: "MinimumOSVersion") as! String)!
    }
    
    //MARK: - 编译信息相关
    class func buildXcodeVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "DTXcode") as! String
    }
    
    class func appLanguages() -> String {
        let arr: NSArray = UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray
        return String("\(arr.firstObject!)")
    }
    
    
}

