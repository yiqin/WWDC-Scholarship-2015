//
//  SoftwareProjectTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class SoftwareProjectTableViewCell: BaseTableViewCell {
    

    
    
    let titleLabel:YQDynamicHeightLabel
    let subtitleLabel:YQDynamicHeightLabel
    
    
    var descriptionPointLabels:[YQDynamicHeightLabel] = []
    
    var softwareProject:SoftwareProject = SoftwareProject()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = YQDynamicHeightLabel()
        subtitleLabel = YQDynamicHeightLabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))
        // titleLabel.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        titleLabel.textAlignment = NSTextAlignment.Left
        titleLabel.textColor = UIColor.blackColor()
        addSubview(titleLabel)
        
        
        subtitleLabel.textAlignment = NSTextAlignment.Left
        subtitleLabel.textColor = UIColor.blackColor()
        addSubview(subtitleLabel)
        
        
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
        titleLabel.text = softwareProject.title
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        titleLabel.update(CGRectMake(xPadding1, 10, tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getTitleLabelFont(), text: softwareProject.title)
        
        subtitleLabel.update(CGRectMake(xPadding1, CGRectGetMaxY(titleLabel.frame), tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: softwareProject.subtitle)
        
        var yLabelPosition:CGFloat = CGRectGetMaxY(subtitleLabel.frame)+yPadding1
        
        for descriptionString in softwareProject.descriptionPoint {
            let tempLabel = YQDynamicHeightLabel()
            tempLabel.update(CGRectMake(xPadding1+xPadding2, yLabelPosition, tempWidth-2*xPadding1-xPadding2, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: descriptionString)
            addSubview(tempLabel)
            yLabelPosition = CGRectGetMaxY(tempLabel.frame)+yPadding1
        }
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
        
        var yLabelPosition:CGFloat = CGRectGetMaxY(subtitleLabel.frame)+10
        
        for descriptionString in readyObject.descriptionPoint {
            let tempLabel = YQDynamicHeightLabel()
            tempLabel.update(CGRectMake(xPadding1+xPadding2, yLabelPosition, tempWidth-2*xPadding1-xPadding2, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: descriptionString)
            // addSubview(tempLabel)
            yLabelPosition = CGRectGetMaxY(tempLabel.frame)+10
        }
        
        return yLabelPosition //CGRectGetMaxY(subtitleLabel.frame)
    }

    

}
