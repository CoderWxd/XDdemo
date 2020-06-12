//
//  WBTabbarViewController.swift
//  SwiftProject
//
//  Created by 王晓栋 on 2020/6/8.
//  Copyright © 2020 com.qixi.live. All rights reserved.
//

import UIKit

class WBTabbarViewController: UITabBarController,UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        // 去掉黑线，底色为白色
        self.tabBar.shadowImage = UIImage()
//        self.tabBar.backgroundImage = UIImage.init(color: UIColor.white, size: CGSize.init(width: 10, height: 10))
        
        
        let homepageNav = WBNavigationController.init(rootViewController: HomeNewViewController())
        homepageNav.tabBarItem.title = "首页"
        homepageNav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.green], for: UIControl.State.normal)
        homepageNav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: UIControl.State.selected)
        homepageNav.tabBarItem.image = UIImage.init(named: "tabbar_home")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        homepageNav.tabBarItem.selectedImage = UIImage.init(named: "tabbar_home_selected")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
         let mineNav = WBNavigationController.init(rootViewController: MeViewController())
        mineNav.tabBarItem.title = "我的"
        mineNav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.green], for: UIControl.State.normal)
        mineNav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: UIControl.State.selected)
        mineNav.tabBarItem.image = UIImage.init(named: "tabbar_mine")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        mineNav.tabBarItem.selectedImage = UIImage.init(named: "tabbar_mine_selected")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        viewControllers = [homepageNav,mineNav]
//        self.delegate = self as? UITabBarControllerDelegate
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if let index = tabBar.items?.index(of: item), let arr = self.viewControllers, arr.count > index, self.selectedIndex != index{
            //            let vc :UIViewController = arr[index];
            // self.showPushAlertView(index: index);
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
