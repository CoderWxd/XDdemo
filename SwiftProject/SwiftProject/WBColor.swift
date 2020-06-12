//
//  WBColor.swift
//  SwiftProject
//
//  Created by 王晓栋 on 2020/6/8.
//  Copyright © 2020 com.qixi.live. All rights reserved.
//

import UIKit

enum WBColor: String {

    case kFC4A51 = "#FC4A51"
    case kC6837F = "#C6837F"
    case kF6F6F6 = "#F6F6F6"
    case kFF6969 = "#FF6969"
    case k535353 = "#535353"
    case kFFEFEE = "#FFEFEE"
    case kCCCCCC = "#CCCCCC"
    case kFF8965 = "#FF8965"
    case kF8F8F8 = "#F8F8F8"
    case kC37171 = "#C37171"
    case kFFAD26 = "#FFAD26"
    case kFF484D = "#FF484D"
    case kF9CBCD = "#F9CBCD"
    case kFF625F = "#FF625F"
    case kCC4F4F = "#CC4F4F"
    // 默认的标题颜色 -- 浅色
    case k2E6ADC = "#2E6ADC"
    /// 默认文本颜色 -- 浅色 #999999
    case defaultTextColor = "#999999"
    /// 默认的标题颜色 -- 浅色 #262626
    case k262626 = "#262626"
    /// 默认的标题颜色 #666666
    case defaultTitleColor = "#666666"
    /// 默认的标题颜色 -- 深色 #333333
    case defaultDarkTitleColor = "#333333"
    /// 深背景色的标题颜色 #FFFFFF
    case darkBackTitleColor = "#FFFFFF"
    // 浅色文字颜色
    case lightTitleColor = "#878787"
    /// 默认的背景颜色 #F5F8FA
    case defaultBackgroundColor = "#F5F8FA"
    /// 默认的边框颜色 #979797
    case defaultBorderColor = "#979797"
    /// 默认的分割线颜色 #EEEEEE
    case defaultLineColor = "#EEEEEE"
    /// 选中的颜色 #FF6363
    case selectedColor = "#FF6363"
    /// 不可用颜色 -- 选中颜色的浅色 #FFE6E
    case enabledColor = "#FFE6E5"
 
    var color: UIColor {
        
        return colorWith(hex: Int(rawValue) ?? 10)
    }
    
    func colorWith(hex: Int, transparency: CGFloat = 1) -> UIColor {
        
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        return UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: trans)
    }
}
