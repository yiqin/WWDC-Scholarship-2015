//
//  ContentTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/24/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class ContentTableViewCell: BaseTableViewCell {
    
    var content:Content = Content()
    let titleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        titleLabel.textAlignment = NSTextAlignment.Left
        titleLabel.textColor = darkGrey // UIColor.blackColor()
        addSubview(titleLabel)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func setContentValue(object:AnyObject){
        content = object as! Content
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        titleLabel.update(CGRectMake(xPadding1, SoftwareProjectTableViewCellSetting.getYPadding1(), tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getDescriptionLabelFont(), text: content.title)
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !AnimationManager.shareInstance.checkRegular(titleLabel.text!) {
            titleLabel.alpha = AnimationManager.regularInitAlpha
            titleLabel.moveY(AnimationManager.regularYOffset)
            
            UIView.animateWithDuration(AnimationManager.regularDuration, delay: AnimationManager.regularDelay, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                
                self.titleLabel.alpha = 1.0
                self.titleLabel.moveY(-AnimationManager.regularYOffset)
                
                }, completion: { finished in
                    println("content")
                    AnimationManager.shareInstance.addRegular(self.titleLabel.text!)
            })
        }
    }
    
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! Content
        
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        let titleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
        
        titleLabel.update(CGRectMake(xPadding1, yPadding1, tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getDescriptionLabelFont(), text: readyObject.title)
        
        if readyObject.isLastOne {
            return CGRectGetMaxY(titleLabel.frame)+yPadding1+SoftwareProjectTableViewCellSetting.getFooterHeight()
        }
        
        return CGRectGetMaxY(titleLabel.frame)+yPadding1
    }

    
}
