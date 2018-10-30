//
//  GlobalMethod.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    //获取最上层ViewController
    func topViewController(_ viewController: UIViewController? = nil) -> UIViewController? {
        let viewController = viewController ?? UIApplication.shared.keyWindow?.rootViewController
        if let navigationController = viewController as? UINavigationController,
            !navigationController.viewControllers.isEmpty {
            return self.topViewController(navigationController.viewControllers.last)
        }
        if let tabBarController = viewController as? UITabBarController,
            let selectedController = tabBarController.selectedViewController {
            return self.topViewController(selectedController)
        }
        if let presentedController = viewController?.presentedViewController {
            return self.topViewController(presentedController)
        }
        
        return viewController
    }
}


