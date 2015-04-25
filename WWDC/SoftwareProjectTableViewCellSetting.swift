//
//  SoftwareProjectTableViewCellSetting.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class SoftwareProjectTableViewCellSetting: NSObject {
    
    class func getHeaderLabelFont()->UIFont {
        return UIFont(name: "OpenSans-Bold", size: 13.0)!
    }
    
    class func getTitleLabelFont()->UIFont {
        return UIFont(name: "Lato-Regular", size: 20)!
    }
    
    class func getSubtitleLabelFont()->UIFont {
        return UIFont(name: "Lato-Regular", size: 13)!
    }
    
    class func getDescriptionLabelFont()->UIFont {
        return UIFont(name: "Lato-Regular", size: 15)!
    }
    
    
    class func getXPadding1()->CGFloat {
        return 30
    }
    
    class func getXPadding2()->CGFloat {
        return 30
    }
    
    class func getYPadding1()->CGFloat {
        return 15
    }
    
    class func getFooterHeight()->CGFloat {
        return 70
    }
    
}
