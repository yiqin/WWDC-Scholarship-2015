//
//  SoftwareProjectTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

protocol SoftwareProjectTableViewCellDelegate {
    func openLink(urlString:String)
}


class SoftwareProjectTableViewCell: BaseTableViewCell {
    
    var delegate: SoftwareProjectTableViewCellDelegate?
    
    var softwareProject:SoftwareProject = SoftwareProject()
    
    let titleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
    let subtitleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
    let projectImageView:UIImageView = UIImageView()
    
    
    let titleButton:UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    
    // No use
    var descriptionPointLabels:[YQDynamicHeightLabel] = []
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        titleButton.addTarget(self, action: "pressedButton:", forControlEvents: UIControlEvents.TouchUpInside)
        titleButton.setTitleColor(lightBlue, forState: UIControlState.Normal)
        titleButton.titleLabel?.numberOfLines = 0
        titleButton.titleLabel?.font = SoftwareProjectTableViewCellSetting.getTitleLabelFont()
        addSubview(titleButton)
        
        
        titleLabel.textAlignment = NSTextAlignment.Left
        
        titleLabel.textColor = lightBlue
        
        addSubview(titleLabel)
        
        
        subtitleLabel.textAlignment = NSTextAlignment.Left
        
        
        subtitleLabel.textColor = UIColor.blackColor()
        
        
        
        addSubview(subtitleLabel)
        
        
        
        projectImageView.contentMode = UIViewContentMode.ScaleAspectFill
        projectImageView.clipsToBounds = true
        addSubview(projectImageView)
        
        
        drawDashLine()
        
        
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
        else {
            projectImageView.image = nil
        }
        
        
        let viewsToRemove = subviews
        for v in viewsToRemove as! [UIView] {
            v.removeFromSuperview()
        }
        
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        titleLabel.update(CGRectMake(xPadding1, SoftwareProjectTableViewCellSetting.getYPadding1(), tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getTitleLabelFont(), text: softwareProject.title)
        // addSubview(titleLabel)
        titleButton.frame = titleLabel.frame
        titleButton.setTitle(titleLabel.text, forState: UIControlState.Normal)
        titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        addSubview(titleButton)
        
        
        subtitleLabel.update(CGRectMake(xPadding1, CGRectGetMaxY(titleLabel.frame), tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: softwareProject.subtitle)
        addSubview(subtitleLabel)
        
        var yLabelPosition:CGFloat = CGRectGetMaxY(subtitleLabel.frame)+yPadding1
        
        
        
        for descriptionString in softwareProject.descriptionPoint {
            let tempLabel = YQDynamicHeightLabel()
            tempLabel.textColor = lightGrey
            tempLabel.update(CGRectMake(xPadding1+xPadding2, yLabelPosition, tempWidth-2*xPadding1-xPadding2, 100), font: SoftwareProjectTableViewCellSetting.getDescriptionLabelFont(), text: descriptionString)
            addSubview(tempLabel)
            
            let tempDotOffset:CGFloat = 9
            let tempDot:UIView = UIView(frame: CGRectMake(CGRectGetMinX(tempLabel.frame)-xPadding2*0.5, CGRectGetMinY(tempLabel.frame)+tempDotOffset, 4, 4))
            tempDot.layer.cornerRadius = 2
            tempDot.backgroundColor = lightGrey// UIColor.blackColor()
            addSubview(tempDot)
            
            yLabelPosition = CGRectGetMaxY(tempLabel.frame)+yPadding1
        }
        
        
        let designedImageWidth:CGFloat = (tempWidth-2*xPadding1-xPadding2-xPadding2)*0.5
        let designedImageHeight:CGFloat = designedImageWidth*3/4
        
        projectImageView.frame = CGRectMake(xPadding1+xPadding2, yLabelPosition+yPadding1, designedImageWidth, designedImageHeight)
        
        addSubview(projectImageView)
        
        
    }
    
    
    func drawDashLine() {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.bounds = self.bounds
        shapeLayer.position = self.center
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = darkGrey.CGColor
        shapeLayer.lineWidth = 1.5
        shapeLayer.lineJoin = kCALineJoinRound
        // dash length
        shapeLayer.lineDashPattern = NSArray(objects: NSNumber(int: 10), NSNumber(int: 8)) as [AnyObject]
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 15, 30)
        CGPathAddLineToPoint(path, nil, 15, 1000)
        shapeLayer.path = path
        
        self.layer.addSublayer(shapeLayer)
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    func pressedButton(sender:UIButton!) {
        delegate?.openLink("http://www.leaftagger.com/")
    }
    

    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! SoftwareProject
        
        let tempWidth = screenWidth
        let xPadding1 = SoftwareProjectTableViewCellSetting.getXPadding1()
        let xPadding2 = SoftwareProjectTableViewCellSetting.getXPadding2()
        let yPadding1 = SoftwareProjectTableViewCellSetting.getYPadding1()
        
        let titleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
        
        titleLabel.update(CGRectMake(xPadding1, SoftwareProjectTableViewCellSetting.getYPadding1(), tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getTitleLabelFont(), text: readyObject.title)
        
        let subtitleLabel:YQDynamicHeightLabel = YQDynamicHeightLabel()
        subtitleLabel.update(CGRectMake(xPadding1, CGRectGetMaxY(titleLabel.frame), tempWidth-2*xPadding1, 100), font: SoftwareProjectTableViewCellSetting.getSubtitleLabelFont(), text: readyObject.subtitle)
        
        var yLabelPosition:CGFloat = CGRectGetMaxY(subtitleLabel.frame)+yPadding1
        
        for descriptionString in readyObject.descriptionPoint {
            let tempLabel = YQDynamicHeightLabel()
            tempLabel.update(CGRectMake(xPadding1+xPadding2, yLabelPosition, tempWidth-2*xPadding1-xPadding2, 100), font: SoftwareProjectTableViewCellSetting.getDescriptionLabelFont(), text: descriptionString)
            // addSubview(tempLabel)
            yLabelPosition = CGRectGetMaxY(tempLabel.frame)+yPadding1
        }
        
        if let tempImage = readyObject.projectImage {
            let designedImageWidth:CGFloat = (tempWidth-2*xPadding1-xPadding2-xPadding2)*0.5
            let designedImageHeight:CGFloat = designedImageWidth*3/4
            
            yLabelPosition = yLabelPosition + designedImageHeight+2*yPadding1
        }
        
        if readyObject.isLastOne {
            yLabelPosition = yLabelPosition+SoftwareProjectTableViewCellSetting.getFooterHeight()
        }
        else {
            yLabelPosition = yLabelPosition+25
        }
        
        return yLabelPosition//  + designedImageHeight+2*yPadding1 //CGRectGetMaxY(subtitleLabel.frame)
    }

    

}
