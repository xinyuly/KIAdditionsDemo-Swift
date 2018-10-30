//
//  Date+Extension.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import Foundation

extension Date {

    /// date转字符串
    ///
    /// - Parameters:
    ///   - date: date
    ///   - format: 字符串格式
    /// - Returns: 字符串日期
    static func dateStringFromDate(date:Date,withFormat format:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone.local
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    /// 时间戳转字符串
    ///
    /// - Parameters:
    ///   - dateString: 时间戳
    ///   - format: 字符串格式
    /// - Returns:
    static func dateWithString(dateString: String, format: String) -> String {
        let timeInterval: TimeInterval = TimeInterval(dateString)!
        let date = Date(timeIntervalSince1970: timeInterval)
        let fm = DateFormatter()
        fm.dateFormat = format
        return fm.string(from: date)
    }
}
