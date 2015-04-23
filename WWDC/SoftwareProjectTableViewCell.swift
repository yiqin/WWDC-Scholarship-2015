//
//  SoftwareProjectTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class SoftwareProjectTableViewCell: BaseTableViewCell {
    
    let titleLabel:UILabel
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))
        titleLabel.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        titleLabel.textAlignment = NSTextAlignment.Right
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Lato-Regular", size: 23)
        titleLabel.textColor = UIColor.blackColor()
        addSubview(titleLabel)
        
        
        setTestColor()

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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    func setContentValue(softwareProject:SoftwareProject){
        
        println(softwareProject.title)
        titleLabel.text = softwareProject.title
        
    }
    
    
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! SoftwareProject
        
        return 150.0
    }

    

}
