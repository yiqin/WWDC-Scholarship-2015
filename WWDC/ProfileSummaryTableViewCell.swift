//
//  ProfileSummaryTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/22/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class ProfileSummaryTableViewCell: BaseTableViewCell {
    
    let profileBackgroundImageView:UIView = UIView()
    let profileImageView:UIImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profileBackgroundImageView.frame = CGRectMake(0, 0, 104, 104)
        profileBackgroundImageView.layer.cornerRadius = CGRectGetWidth(profileBackgroundImageView.frame)*0.5
        profileBackgroundImageView.backgroundColor = UIColor.whiteColor()
        
        addSubview(profileBackgroundImageView)
        
        
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
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.center = CGPointMake(center.x, profileImageView.center.y)
        profileBackgroundImageView.center = profileImageView.center
    }
    
    
    func setContentValue(object:AnyObject){
        let profileSummary = object as! ProfileSummary
        // This would cause a crash if profileSummary images are nil!
        // fatal error: unexpectedly found nil while unwrapping an Optional value
        if let tempProfileImage = profileSummary.profileImage {
            profileImageView.image = profileSummary.profileImage
        }
        else {
            profileImageView.image = UIImage()
        }
        
        backgroundImageView.image = profileSummary.backgroundImage
    }
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! ProfileSummary
        
        return 280.0
    }

}
