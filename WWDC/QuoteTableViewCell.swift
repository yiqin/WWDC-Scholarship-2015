//
//  QuoteTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class QuoteTableViewCell: BaseTableViewCell {
    
    var setupYContent:CGFloat = 0
    
    let titleLabel:UILabel = UILabel()
    var backgroundImageScrollView:UIScrollView = UIScrollView()
    
    var isScroll:Bool = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundImageView.removeFromSuperview()
        
        // Init backgroundImageScrollView
        backgroundImageScrollView.frame = CGRectMake(0, 0, screenWidth, QuoteTableViewCell.cellHeight(Quote()))
        backgroundImageScrollView.scrollEnabled = false
        backgroundImageScrollView.contentSize = CGSizeMake(screenWidth, QuoteTableViewCell.cellHeight(Quote())*1.5)
        addSubview(backgroundImageScrollView)
        
        
        backgroundImageView.frame = CGRectMake(0, -QuoteTableViewCell.cellHeight(Quote())*0.5, screenWidth, QuoteTableViewCell.cellHeight(Quote())*2.0)
        backgroundImageScrollView.addSubview(backgroundImageView)
        
        
        titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))
        titleLabel.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "PlayfairDisplay-BoldItalic", size: 23)
        titleLabel.textColor = UIColor.whiteColor()
        addSubview(titleLabel)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateMove:", name: "updateMove", object: nil)
    }
    
    // MARK: perform the deinitialization
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver("updateMove")
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateMove(notification: NSNotification) {
        let yContent = notification.userInfo!["yContent"] as! CGFloat
        
        if isScroll {
            let yOffset = yContent-setupYContent
            backgroundImageScrollView.contentOffset = CGPointMake(0, yOffset*0.07)
        }
        else {
            setupYContent = yContent
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !AnimationManager.shareInstance.checkRegular(titleLabel.text!) {
            titleLabel.alpha = AnimationManager.regularInitAlpha
            titleLabel.moveX(AnimationManager.regularYOffset)
            
            UIView.animateWithDuration(AnimationManager.regularDuration, delay: AnimationManager.regularDelay, options: UIViewAnimationOptions.CurveLinear, animations: {
                
                self.titleLabel.alpha = 1.0
                self.titleLabel.moveX(-AnimationManager.regularYOffset)
                
                }, completion: { finished in
                    AnimationManager.shareInstance.addRegular(self.titleLabel.text!)
                    self.isScroll = true
            })
        }
    }
    
    func setContentValue(object:AnyObject, setupYContent:CGFloat){
        let quote = object as! Quote
        
        titleLabel.text = quote.title
        backgroundImageView.image = quote.backgroundImage
        self.setupYContent = setupYContent
        
        
    }
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! Quote
        
        return 130.0
    }

}
