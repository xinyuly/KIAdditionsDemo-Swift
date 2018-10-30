//
//  UIViewController+Extension.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// 导航栏左边添加图标按钮
    ///
    /// - Parameters:
    ///   - imageName: 图片名字
    ///   - highlightedImage: 图片高亮名字
    ///   - selector: 按钮事件
    func showLeftBarItem(imageName: String, highlightedImage:String,selector:Selector? ) {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highlightedImage), for: .highlighted)
        if selector != nil {
            btn.addTarget(self, action: selector!, for: .touchUpInside)
        }
        btn.contentHorizontalAlignment = .left
        let item = UIBarButtonItem.init(customView: btn)
        self.navigationItem.leftBarButtonItems = [item]
    }
    
    func showRightBarItem(imageName: String, highlightedImage:String,selector:Selector? ) {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 36)
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        btn.imageView?.tintColor = UIColor.white
        btn.setImage(image, for: .normal)
        btn.setImage(UIImage(named: highlightedImage)?.withRenderingMode(.alwaysTemplate), for: .highlighted)
        if selector != nil {
            btn.addTarget(self, action: selector!, for: .touchUpInside)
        }
        btn.contentHorizontalAlignment = .right
        let item = UIBarButtonItem.init(customView: btn)
        self.navigationItem.rightBarButtonItem = item
    }
    
    
    /// 左边文字按钮事件
    ///
    /// - Parameters:
    ///   - title: 按钮title
    ///   - selector: 按钮事件
    func showLeftBarItem(title:String,selector:Selector?) {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.white, for: .highlighted)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.titleLabel?.lineBreakMode = .byTruncatingTail
        let size = title.size(withAttributes: [NSAttributedString.Key.font:btn.titleLabel?.font as Any])
        let width = min(120, size.width + 12.0 )
        
        btn.frame = CGRect(x: 0, y: 0, width: width, height: 24)
        if (selector != nil) {
            btn.addTarget(self, action: selector!, for: .touchUpInside)
        }
        btn.contentHorizontalAlignment = .left
        let item = UIBarButtonItem.init(customView: btn)
        self.navigationItem.leftBarButtonItem = item
    }
    
    func showRightBarItem(title:String,selector:Selector?) {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.white, for: .highlighted)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        let size = title.size(withAttributes: [NSAttributedString.Key.font:btn.titleLabel?.font as Any])
        let width = min(120, size.width + 12.0 )
        
        btn.frame = CGRect(x: 0, y: 0, width: width, height: 24)
        if (selector != nil) {
            btn.addTarget(self, action: selector!, for: .touchUpInside)
        }
        btn.contentHorizontalAlignment = .right
        let item = UIBarButtonItem.init(customView: btn)
        self.navigationItem.rightBarButtonItem = item
    }
    
    //添加返回按钮
    func showBackItem() {
        showLeftBarItem(imageName: "nav_back", highlightedImage: "nav_back", selector: #selector(back))
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    //退到根视图
    func dismissToRootViewController() {
        var vc = self.presentingViewController
        while ((vc?.presentingViewController) != nil) {
            vc = vc?.presentingViewController
        }
        vc?.dismiss(animated: true, completion: nil)
    }
    
    func willDisapperByPop() -> Bool {
        let viewControllers: [UIViewController] = (self.navigationController?.viewControllers)!
        if viewControllers.count > 1 && viewControllers[viewControllers.count - 2] == self {
            return false
        } else {
            return true
        }
    }
    
    //退到指定的控制器
    func popToViewControllerClass(aClass:AnyClass, animated:Bool) {
        for vc in (self.navigationController?.viewControllers)! {
            if vc.isKind(of: aClass) {
                self.navigationController?.popToViewController(vc, animated: animated)
            }
        }
    }
}

