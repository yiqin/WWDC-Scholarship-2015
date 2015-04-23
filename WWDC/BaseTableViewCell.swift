//
//  BaseTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    let backgroundImageView:UIImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clearColor()
        clipsToBounds = true
        
        backgroundImageView.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))
        backgroundImageView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
        addSubview(backgroundImageView)
        
        selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
