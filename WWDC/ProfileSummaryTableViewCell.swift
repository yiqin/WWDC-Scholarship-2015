//
//  ProfileSummaryTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/22/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class ProfileSummaryTableViewCell: BaseTableViewCell {
    
    
    
    
    let nameLabel: UILabel = UILabel()
    let taglineLabel: UILabel = UILabel()
    
    
    var scrollView:UIScrollView = UIScrollView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clearColor()
        clipsToBounds = false
        backgroundImageView.removeFromSuperview()
        
        scrollView.frame = CGRectMake(0, 0, screenWidth, 280.0)
        // scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        scrollView.scrollEnabled = false
        
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = CGSizeMake(screenWidth, 380)
        scrollView.contentOffset = CGPointZero
        
        backgroundImageView.frame = CGRectMake(0, 0, screenWidth, 380)
        backgroundImageView.contentMode = UIViewContentMode.Bottom
        
        
        // scrollView.addSubview(backgroundImageView)
        addSubview(scrollView)
        
        
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // profileImageView.center = CGPointMake(center.x, profileImageView.center.y)
        // profileBackgroundImageView.center = profileImageView.center
        
        // NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateMove:", name: "updateMove", object: nil)
    }
    
    func updateMove(notification: NSNotification) {
    
        let yContent = notification.userInfo!["yContent"] as! CGFloat
        
        println(yContent)
        
        scrollView.contentOffset = CGPointMake(0, -yContent*0.5)
    }
    
    
    func setContentValue(object:AnyObject){
        let profileSummary = object as! ProfileSummary
        // This would cause a crash if profileSummary images are nil!
        // fatal error: unexpectedly found nil while unwrapping an Optional value
        if let tempProfileImage = profileSummary.profileImage {
            // profileImageView.image = profileSummary.profileImage
        }
        else {
            // profileImageView.image = UIImage()
        }
        
        backgroundImageView.image = profileSummary.backgroundImage
    }
    
    
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! ProfileSummary
        
        return 280.0
    }

}
