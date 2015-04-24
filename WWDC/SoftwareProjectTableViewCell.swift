//
//  SoftwareProjectTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class SoftwareProjectTableViewCell: BaseTableViewCell {
    
    static let xPadding1: CGFloat = 30
    static let xPadding2: CGFloat = 30
    
    
    
    
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
        
        titleLabel.update(CGRectMake(10, 10, 200, 100), font: SoftwareProjectTableViewCellSetting.getTitleLabelFont(), text: softwareProject.title)
        
        subtitleLabel.update(CGRectMake(10, CGRectGetMaxY(titleLabel.frame), 200, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: softwareProject.subtitle)
        
        var yLabelPosition:CGFloat = CGRectGetMaxY(subtitleLabel.frame)+10
        
        for descriptionString in softwareProject.descriptionPoint {
            let tempLabel = YQDynamicHeightLabel()
            tempLabel.update(CGRectMake(50, yLabelPosition, 200, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: descriptionString)
            addSubview(tempLabel)
            yLabelPosition = CGRectGetMaxY(tempLabel.frame)+10
        }
    }
    

    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! SoftwareProject
        
        let titleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
        
        titleLabel.update(CGRectMake(10, 10, 200, 100), font: SoftwareProjectTableViewCellSetting.getTitleLabelFont(), text: readyObject.title)
        
        let subtitleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
        subtitleLabel.update(CGRectMake(10, CGRectGetMaxY(titleLabel.frame), 200, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: readyObject.subtitle)
        
        var yLabelPosition:CGFloat = CGRectGetMaxY(subtitleLabel.frame)+10
        
        for descriptionString in readyObject.descriptionPoint {
            let tempLabel = YQDynamicHeightLabel()
            tempLabel.update(CGRectMake(50, yLabelPosition, 200, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: descriptionString)
            // addSubview(tempLabel)
            yLabelPosition = CGRectGetMaxY(tempLabel.frame)+10
        }
        
        return yLabelPosition //CGRectGetMaxY(subtitleLabel.frame)
    }

    

}
