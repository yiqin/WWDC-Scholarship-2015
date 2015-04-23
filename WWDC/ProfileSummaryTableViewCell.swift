//
//  ProfileSummaryTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/22/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class ProfileSummaryTableViewCell: BaseTableViewCell {
    
    let profileImageView:UIImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profileImageView.frame = CGRectMake(CGRectGetWidth(frame)*0.5, 40, 100, 100)
        // profileImageView.autoresizingMask = UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin
        
        profileImageView.layer.cornerRadius = CGRectGetWidth(profileImageView.frame)*0.5
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        addSubview(profileImageView)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.center = CGPointMake(center.x, profileImageView.center.y)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setContentValue(profileSummary:ProfileSummary){
        
        // This would cause a crash if profileSummary images are nil!
        // fatal error: unexpectedly found nil while unwrapping an Optional value
        profileImageView.image = profileSummary.profileImage
        backgroundImageView.image = profileSummary.backgroundImage
    }
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! ProfileSummary
        
        return 250.0
    }

}
