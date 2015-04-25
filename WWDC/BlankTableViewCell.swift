//
//  BlankTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/25/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class BlankTableViewCell: BaseTableViewCell {
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.whiteColor()
    }
    
    class func cellHeight()->CGFloat {
        return 18.0
    }
}
