//
//  AppTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/25/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class AppTableViewCell: BaseTableViewCell {
    
    var scrollView:UIScrollView = UIScrollView()
    var scrollViewContainer:ScrollViewContainer = ScrollViewContainer()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        let imageWidth = (tempWidth-3*xPadding1)
        let imageHeight = imageWidth*0.58
        
        scrollView.frame = CGRectMake(xPadding1*1, yPadding1, tempWidth-xPadding1*2, imageHeight+2*yPadding1)
        scrollView.clipsToBounds = false
        scrollView.pagingEnabled = true
        scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, +15, 0)
        
        scrollViewContainer.frame = CGRectMake(0, 0, screenWidth,  imageHeight+2*yPadding1)
        scrollViewContainer.scrollView = scrollView
        scrollViewContainer.addSubview(scrollView)
        addSubview(scrollViewContainer)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func setContentValue(object:AnyObject){
        
        let apps:[App] = AppDataManager.shareInstance.apps
        
        let viewsToRemove = scrollView.subviews
        for v in viewsToRemove as! [UIView] {
            v.removeFromSuperview()
        }
        
        let tempWidth = screenWidth
        let xPadding1:CGFloat = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        
        let imageWidth = CGRectGetWidth(scrollView.frame)-xPadding1*0.5
        let imageHeight = imageWidth*0.58
        
        let imageCount:CGFloat = CGFloat(apps.count)
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame)*imageCount, CGRectGetHeight(scrollView.frame))
        
        var xPosition:CGFloat = xPadding1*0.25
        for app in apps {
            let tempView = UIView(frame: CGRectMake(xPosition, 0, imageWidth, imageHeight))
            
            // tempView.backgroundColor = UIColor.redColor()
            tempView.clipsToBounds = true
            
            
            let tempImageView = UIImageView(frame: CGRectMake(0, 0, imageWidth*0.2, imageWidth*0.2))
            tempImageView.image = app.iconImage
            tempView.addSubview(tempImageView)
            
            tempImageView.layer.cornerRadius = 5.0
            tempImageView.clipsToBounds = true
            
            let tempTitleLabel = UILabel(frame: CGRectMake(CGRectGetMaxX(tempImageView.frame)+xPadding1, 0, CGRectGetWidth(tempView.frame)-2*xPadding1-CGRectGetMaxX(tempImageView.frame), imageWidth*0.2))
            tempTitleLabel.text = app.title
            tempTitleLabel.font = SoftwareProjectTableViewCellSetting.getTitleLabelFont()
            tempTitleLabel.numberOfLines = 0
            
            tempView.addSubview(tempTitleLabel)
            
            scrollView.addSubview(tempView)
            xPosition = xPosition+xPadding1*0.5+imageWidth
            
        }
        scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! App
        
        var yHeight:CGFloat = 0
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        let imageWidth = (tempWidth-3*xPadding1)
        let imageHeight = imageWidth*0.58
        
        yHeight = yHeight+imageHeight+2*yPadding1
        
        if readyObject.isLastOne {
            return yHeight+SoftwareProjectTableViewCellSetting.getFooterHeight()
        }
        
        return yHeight
    }


}
