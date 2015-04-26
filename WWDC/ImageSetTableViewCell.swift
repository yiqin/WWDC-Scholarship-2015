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
    
    var imageView1:UIImageView = UIImageView()
    var imageView2:UIImageView = UIImageView()
    var imageView3:UIImageView = UIImageView()
    
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
        
        imageView1.frame = CGRectMake(xPadding1, 0, imageWidth, imageHeight)
        imageView2.frame = CGRectMake(CGRectGetMaxX(imageView1.frame)+xPadding1*0.5, 0, imageWidth, imageHeight)
        imageView3.frame = CGRectMake(CGRectGetMaxX(imageView2.frame)+xPadding1*0.5, 0, imageWidth, imageHeight)
        
        imageView1.contentMode = UIViewContentMode.ScaleAspectFill
        imageView1.clipsToBounds = true
        imageView2.contentMode = UIViewContentMode.ScaleAspectFill
        imageView2.clipsToBounds = true
        imageView3.contentMode = UIViewContentMode.ScaleAspectFill
        imageView3.clipsToBounds = true
        
        
        
        scrollView.frame = CGRectMake(xPadding1, yPadding1, tempWidth-xPadding1*2, imageHeight+2*yPadding1)
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSizeMake((imageWidth+xPadding1)*3, imageHeight+2*yPadding1)
        scrollView.setContentOffset(CGPointMake((imageWidth+xPadding1),0), animated: false)
        scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, +15, 0)
        
        scrollView.addSubview(imageView1)
        scrollView.addSubview(imageView2)
        scrollView.addSubview(imageView3)
        
        scrollView.pagingEnabled = true
        
        
        
        scrollViewContainer.frame = CGRectMake(0, 0, screenWidth,  imageHeight+2*yPadding1)
        // scrollViewContainer.backgroundColor = UIColor.grayColor()
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
        
        
        imageView1.image = imageSet.image1
        imageView2.image = imageSet.image2
        imageView3.image = imageSet.image3
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        let imageWidth = (tempWidth-3*xPadding1)
        let imageHeight = imageWidth*0.58
        
        var xPosition:CGFloat = xPadding1*0.5
        
        for tempImage in imageSet.pageImages {
            let tempImageView = UIImageView(frame: CGRectMake(xPosition, 0, imageWidth, imageHeight))
            
            tempImageView.contentMode = UIViewContentMode.ScaleAspectFill
            tempImageView.clipsToBounds = true
            
            scrollView.addSubview(tempImageView)
            xPosition = xPosition+xPadding1*0.5
        }
        

        
        let imageCount:CGFloat = CGFloat(imageSet.pageImages.count)
        scrollView.contentSize = CGSizeMake((imageWidth+xPadding1)*imageCount, CGRectGetHeight(scrollView.frame))
        scrollView.setContentOffset(CGPointMake((imageWidth+xPadding1),0), animated: false)
        
        
        
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
