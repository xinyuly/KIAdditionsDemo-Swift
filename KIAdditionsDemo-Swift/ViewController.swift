//
//  ViewController.swift
//  KIAdditionsDemo-Swift
//
//  Created by lixinyu on 2018/10/29.
//  Copyright © 2018年 lixinyu. All rights reserved.
//

import UIKit
import SnapKit
import MBProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var tButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tButton.hitTestEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: -10)
//        tButton.backgroundColor = UIColor.init(hexString: "#F51E49")
//        tButton.backgroundColor = UIColor.colorWithHexString("#F51E49", 1)
//        tButton.setBackgroundImage(UIColor.yellow.colorImage(), for: .normal)
//        tButton.addBezierCorner(byRoundingCorners: [.topLeft,.topRight,.bottomRight], cornerRadius: 10)
//        tButton.addShadowToView(shadowOpacity: 10, shadowRadius: 10, cornerRadius: 10)
    }

    @IBAction func hitAction(_ sender: Any) {
        tButton.showIndicatorView()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.tButton.dismissIndicatorView()
        }
    }
    
}

