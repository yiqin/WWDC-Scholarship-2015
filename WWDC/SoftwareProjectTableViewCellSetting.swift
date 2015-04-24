//
//  SoftwareProjectTableViewCellSetting.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class SoftwareProjectTableViewCellSetting: NSObject {
    
    
    class func getTitleLabelFont()->UIFont {
        return UIFont(name: "Lato-Regular", size: 17)!
    }
    
    class func getSubtitleLabelFont()->UIFont {
        return UIFont(name: "Lato-Regular", size: 13)!
    }
    
    class func getDescriptionLabelFont()->UIFont {
        return UIFont(name: "Lato-Regular", size: 14)!
    }
    
    
    class func getXPadding1()->CGFloat {
        return 30
    }
    
    class func getXPadding2()->CGFloat {
        return 30
    }
    
    class func getYPadding1()->CGFloat {
        return 10
    }
}
