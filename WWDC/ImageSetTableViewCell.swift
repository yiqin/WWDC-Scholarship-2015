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
        let imageHeight = imageWidth*0.65
        
        imageView1.frame = CGRectMake(xPadding1, yPadding1, imageWidth, imageHeight)
        imageView2.frame = CGRectMake(CGRectGetMaxX(imageView1.frame)+xPadding1*0.5, yPadding1, imageWidth, imageHeight)
        imageView3.frame = CGRectMake(CGRectGetMaxX(imageView2.frame)+xPadding1*0.5, yPadding1, imageWidth, imageHeight)
        
        imageView1.contentMode = UIViewContentMode.ScaleAspectFill
        imageView1.clipsToBounds = true
        imageView2.contentMode = UIViewContentMode.ScaleAspectFill
        imageView2.clipsToBounds = true
        imageView3.contentMode = UIViewContentMode.ScaleAspectFill
        imageView3.clipsToBounds = true
        
        // addSubview(imageView1)
        // addSubview(imageView2)
        // addSubview(imageView3)
        
        scrollView.frame = CGRectMake(xPadding1*2, yPadding1, tempWidth-xPadding1*4, imageHeight+2*yPadding1)
        
        
        scrollView.contentSize = CGSizeMake(imageWidth*3, imageHeight+2*yPadding1)// contentSize = CGPoint()
        scrollView.addSubview(imageView1)
        scrollView.addSubview(imageView2)
        scrollView.addSubview(imageView3)
        
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
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()*0.5
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        // titleLabel.update(CGRectMake(xPadding1, SoftwareProjectTableViewCellSetting.getYPadding1(), tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getDescriptionLabelFont(), text: content.title)
        
        backgroundColor = UIColor.greenColor()
        
        imageView1.image = imageSet.image1
        imageView2.image = imageSet.image2
        imageView3.image = imageSet.image3
        
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
        let imageHeight = imageWidth*0.65
        
        yHeight = yHeight+imageHeight+2*yPadding1
        
        if readyObject.isLastOne {
            return yHeight+SoftwareProjectTableViewCellSetting.getFooterHeight()
        }
        
        return yHeight
    }


}
