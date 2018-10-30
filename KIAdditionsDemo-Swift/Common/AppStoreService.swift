//
//  AppStoreService.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import UIKit

class AppStoreService: NSObject {
    
    /// 版本检测是否更新
    ///
    /// - Parameters:
    ///   - appID: app ID
    ///   - isForceUpdate: 是否强制更新
    static func checkVersion(appID: String, isForceUpdate: Bool = false) {
        if appID.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == 0 {
            return
        }
        let urlPath = String(format:"http://itunes.apple.com/lookup?id=%@",appID)
        let url = URL(string: urlPath)
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            guard let data = data else {return}
            guard let appInfo:[String:Any] = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any] else{return}
            
            let results = appInfo["results"] as! [[String:Any]]
            if results.count > 0 {
                var result:[String:Any] = results.first!
                let versionsInAppStore:String = result["version"] as! String
                if versionsInAppStore.count > 0  {
                    let bundleVersion:String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
                    if bundleVersion.compare(versionsInAppStore) == .orderedAscending {
                        //弹框提示
                        showAlert(appStoreVersion: versionsInAppStore, appleID: appID, updateInfo: result["releaseNotes"] as? String,isForceUpdate:isForceUpdate)
                    } else {
                        //版本已经是最新版
                        
                    }
                }
            }
            
        })
        
        task.resume()
    }
    
    class func showAlert(appStoreVersion: String, appleID: String, updateInfo: String?, isForceUpdate:Bool) {
        let title = "有新版本更新啦！"
        var message = String(format:"发现最新版本%@,现在去AppStore升级？",appStoreVersion)
        if updateInfo != nil {
            message = updateInfo!
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if !isForceUpdate {
            let cancelAction = UIAlertAction(title: "暂不升级", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
        }
        
        let updateAction = UIAlertAction(title: "立即更新", style: .default) { (action) in
            let url = URL(string: String(format:"https://itunes.apple.com/cn/app/id%@",appleID))
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        alertController.addAction(updateAction)
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
