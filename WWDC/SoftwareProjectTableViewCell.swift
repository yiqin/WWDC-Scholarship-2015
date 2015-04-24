//
//  SoftwareProjectTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class SoftwareProjectTableViewCell: BaseTableViewCell {
    
    var softwareProject:SoftwareProject = SoftwareProject()
    
    let titleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
    let subtitleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
    let projectImageView:UIImageView = UIImageView()
    
    // No use
    var descriptionPointLabels:[YQDynamicHeightLabel] = []
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))
        // titleLabel.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        titleLabel.textAlignment = NSTextAlignment.Left
        
        titleLabel.textColor = lightBlue
        
        addSubview(titleLabel)
        
        
        subtitleLabel.textAlignment = NSTextAlignment.Left
        
        
        subtitleLabel.textColor = UIColor.blackColor()
        
        
        
        addSubview(subtitleLabel)
        
        
        addSubview(projectImageView)
        
        // setTestColor()

    }
    
    func setTestColor(){
        titleLabel.backgroundColor = UIColor.yellowColor()
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setContentValue(object:AnyObject){
        
        softwareProject = object as! SoftwareProject
        
        if let tempImage = softwareProject.projectImage {
            projectImageView.image = tempImage
        }
        
        
        let viewsToRemove = subviews
        for v in viewsToRemove as! [UIView] {
            v.removeFromSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        titleLabel.update(CGRectMake(xPadding1, 10, tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getTitleLabelFont(), text: softwareProject.title)
        addSubview(titleLabel)
        
        subtitleLabel.update(CGRectMake(xPadding1, CGRectGetMaxY(titleLabel.frame), tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: softwareProject.subtitle)
        addSubview(subtitleLabel)
        
        var yLabelPosition:CGFloat = CGRectGetMaxY(subtitleLabel.frame)+yPadding1

        /*
        // Need to remove
        let viewsToRemove = subviews
        for v in viewsToRemove as! [UIView] {
            if CGRectGetMinY(v.frame) >= yLabelPosition {
                v.removeFromSuperview()
            }
        }
        */
        
        for descriptionString in softwareProject.descriptionPoint {
            let tempLabel = YQDynamicHeightLabel()
            tempLabel.textColor = lightGrey
            tempLabel.update(CGRectMake(xPadding1+xPadding2, yLabelPosition, tempWidth-2*xPadding1-xPadding2, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: descriptionString)
            addSubview(tempLabel)
            yLabelPosition = CGRectGetMaxY(tempLabel.frame)+yPadding1
        }
        
        
        projectImageView.frame = CGRectMake(xPadding1+xPadding2, yLabelPosition, tempWidth-2*xPadding1-xPadding2*2, 100)
        projectImageView.contentMode = UIViewContentMode.ScaleAspectFit
        addSubview(projectImageView)
        
    }
    

    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! SoftwareProject
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        
        let titleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
        
        titleLabel.update(CGRectMake(xPadding1, 10, tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getTitleLabelFont(), text: readyObject.title)
        
        let subtitleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
        subtitleLabel.update(CGRectMake(xPadding1, CGRectGetMaxY(titleLabel.frame), tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: readyObject.subtitle)
        
        var yLabelPosition:CGFloat = CGRectGetMaxY(subtitleLabel.frame)+yPadding1
        
        for descriptionString in readyObject.descriptionPoint {
            let tempLabel = YQDynamicHeightLabel()
            tempLabel.update(CGRectMake(xPadding1+xPadding2, yLabelPosition, tempWidth-2*xPadding1-xPadding2, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: descriptionString)
            // addSubview(tempLabel)
            yLabelPosition = CGRectGetMaxY(tempLabel.frame)+yPadding1
        }
        
        
        
        // Minimized this work.....
        if let tempImage = readyObject.projectImage {
            let designedImageWidth = tempWidth-2*xPadding1-xPadding2*2
            let tempImageWidth = tempImage.size.width
            let tempImageHeight = tempImage.size.height
            
            let designedImageHeight:CGFloat = designedImageWidth*tempImageHeight/tempImageWidth
            
            if designedImageHeight > 10 {
                return yLabelPosition + designedImageHeight+2*yPadding1
            }
            
            println("what \(designedImageHeight)")
            //
        }
        
        
        
        return yLabelPosition//  + designedImageHeight+2*yPadding1 //CGRectGetMaxY(subtitleLabel.frame)
    }

    

}
