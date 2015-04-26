//
//  QuoteTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class QuoteTableViewCell: BaseTableViewCell {
    
    
    let titleLabel:UILabel
    
    var backgroundImageScrollView:UIScrollView = UIScrollView()
    
    
    var setupYContent:CGFloat = 0
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundImageView.removeFromSuperview()
        
        
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
        
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateMove(notification: NSNotification) {
        
        let yContent = notification.userInfo!["yContent"] as! CGFloat
        let yOffset = yContent-setupYContent
        
        backgroundImageScrollView.contentOffset = CGPointMake(0, yOffset*0.07)
        
        // println("\(yOffset) update the quote \(titleLabel.text)")
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setContentValue(object:AnyObject, setupYContent:CGFloat){
        let quote = object as! Quote
        // This would cause a crash if profileSummary images are nil!
        // fatal error: unexpectedly found nil while unwrapping an Optional value
        titleLabel.text = quote.title
        backgroundImageView.image = quote.backgroundImage
        
        self.setupYContent = setupYContent
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateMove:", name: "updateMove", object: nil)
    }

    
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! Quote
        
        return 130.0
    }

}
