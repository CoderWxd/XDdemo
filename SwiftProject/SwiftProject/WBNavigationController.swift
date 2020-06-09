//
//  WBNavigationController.swift
//  SwiftProject
//
//  Created by 王晓栋 on 2020/6/8.
//  Copyright © 2020 com.qixi.live. All rights reserved.
//

import UIKit

// 定义一个protocol，实现它的类，自定义pop规则、逻辑或方法
protocol NavigationControllerBackButtonDelegate {
    func shouldPopOnBackButtonPress() -> Bool
}

// 实现自己的NavigationController，它是UINavigationController的子类，并且遵循UINavigationBarDelegate
class WBNavigationController: UINavigationController, UINavigationBarDelegate, UINavigationControllerDelegate , UIGestureRecognizerDelegate{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    // 实现navigationBar(_: shouldPop:)
    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        
        var shouldPop = true
        // 已修改（标记1）
        let viewControllersCount = self.viewControllers.count
        let navigationItemsCount = navigationBar.items?.count
        
        if(viewControllersCount < navigationItemsCount!){
            return shouldPop
        }
        if let topViewController: UIViewController = self.topViewController {
            if(topViewController is NavigationControllerBackButtonDelegate){
                let delegate = topViewController as! NavigationControllerBackButtonDelegate
                shouldPop = delegate.shouldPopOnBackButtonPress()
            }
        }
        if shouldPop == false {
            isNavigationBarHidden = true
            isNavigationBarHidden = false
        } else {
            if viewControllersCount >= navigationItemsCount! {
                DispatchQueue.main.async { () -> Void in
                    self.popViewController(animated: true)
                }
            }
        }
        return shouldPop
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        self.interactivePopGestureRecognizer?.isEnabled = true
    
        
//        let backImage = UIImage.init(named: "icon_back")!
        let backItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
//
//        // 首页导航栏返回
//        navigationBar.backIndicatorImage = backImage
//        navigationBar.backIndicatorTransitionMaskImage = backImage
        visibleViewController?.navigationItem.backBarButtonItem = backItem
//        navigationBar.barStyle = UIBarStyle.default
//        navigationBar.tintColor = WBColor.defaultDarkTitleColor.color
        
    }
    
//    func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
//        let backImage = UIImage.init(named: "icon_back")!
//        let backItem = UIBarButtonItem.init(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
//
//        // 首页导航栏返回
//        navigationBar.backIndicatorImage = backImage
//        navigationBar.backIndicatorTransitionMaskImage = backImage
//        visibleViewController?.navigationItem.backBarButtonItem = backItem
//        navigationBar.barStyle = UIBarStyle.default
//        navigationBar.tintColor = WBColor.defaultDarkTitleColor.color
        
//        return true
//    }
    
}
