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
        scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, +15, 0)
        
        scrollViewContainer.frame = CGRectMake(0, 0, screenWidth,  imageHeight+2*yPadding1)
        scrollViewContainer.scrollView = scrollView
        scrollViewContainer.addSubview(scrollView)
        addSubview(scrollViewContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setContentValue(object:AnyObject){
        imageSet = object as! ImageSet
        
        
        // MARK: - remove the views on the scrollView
        let viewsToRemove = self.scrollView.subviews
        for v in viewsToRemove {
            v.removeFromSuperview()
        }
        
        // MARK: Get the information for the size
        let tempWidth = screenWidth
        let xPadding1:CGFloat = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        
        let imageWidth = CGRectGetWidth(self.scrollView.frame)-xPadding1*0.5
        let imageHeight = imageWidth*0.58
        
        let imageCount:CGFloat = CGFloat(self.imageSet.pageImages.count)
        self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame)*imageCount, CGRectGetHeight(self.scrollView.frame))
        
        // Note:
        // UIImage can be anywhere
        
        // UIImageView must be the main queue.
        
        
        // MARK: - Create image views and add them to the scrollView again.
        var xPosition:CGFloat = xPadding1*0.25
        for tempImage in self.imageSet.pageImages {
            
            
            let tempImageView = UIImageView(frame: CGRectMake(xPosition, 0, imageWidth, imageHeight))
            
            tempImageView.image = tempImage
            tempImageView.contentMode = UIViewContentMode.ScaleAspectFill
            tempImageView.clipsToBounds = true
            
            
            self.scrollView.addSubview(tempImageView)
            xPosition = xPosition+xPadding1*0.5+imageWidth
            
        }
        self.scrollView.setContentOffset(CGPointMake(0, 0), animated: false)
            

        
        
        // Cornor radius. 
        // CALayer corder radios is very expensive...
        // One or two is ok.
        // If we have 10, take the image, put the image and other into the background, and reutn ......
        // 
        
        // Last year. Advanced graphs and animations for iOS apps.
        
        // 
        
        
        
        // UIKit
        // UIViewController, UIImageView
        // UIViewController, UIView...... - must be accessed by the main queue.
        
        
        
        // NSCache 
        // It will automataclly do it for me.
        
        
        
            
            
        /*
        // MARK: - remove the views on the scrollView
        let viewsToRemove = scrollView.subviews
        for v in viewsToRemove as! [UIView] {
            v.removeFromSuperview()
        }
        
        let tempWidth = screenWidth
        let xPadding1:CGFloat = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        
        let imageWidth = CGRectGetWidth(scrollView.frame)-xPadding1*0.5
        let imageHeight = imageWidth*0.58
        
        let imageCount:CGFloat = CGFloat(imageSet.pageImages.count)
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame)*imageCount, CGRectGetHeight(scrollView.frame))
        
        // MARK: - Create image views and add them to the scrollView again.
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
        */
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // self.addSubview(self.scrollView)
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
