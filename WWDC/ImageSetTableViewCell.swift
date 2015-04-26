//
//  ImageSetTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/26/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class ImageSetTableViewCell: BaseTableViewCell {
    
    var imageSet:ImageSet = ImageSet()
    
    var pageImages:[UIImage] = []
    
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
        imageSet = object as! ImageSet
        
        let viewsToRemove = scrollView.subviews
        for v in viewsToRemove as! [UIView] {
            v.removeFromSuperview()
        }
        
        let tempWidth = screenWidth
        let xPadding1:CGFloat = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        
        let imageWidth = CGRectGetWidth(scrollView.frame)-xPadding1*0.5// (tempWidth-4*xPadding1)
        let imageHeight = imageWidth*0.58
        
        let imageCount:CGFloat = CGFloat(imageSet.pageImages.count)
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame)*imageCount, CGRectGetHeight(scrollView.frame))
        
        var xPosition:CGFloat = xPadding1*0.25
        for tempImage in imageSet.pageImages {
            let tempImageView = UIImageView(frame: CGRectMake(xPosition, 0, imageWidth, imageHeight))
            
            tempImageView.image = tempImage
            tempImageView.contentMode = UIViewContentMode.ScaleAspectFill
            tempImageView.clipsToBounds = true
            
            scrollView.addSubview(tempImageView)
            xPosition = xPosition+xPadding1*0.5+imageWidth
            
        }
        scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
        scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, +15, 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! ImageSet
        
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
