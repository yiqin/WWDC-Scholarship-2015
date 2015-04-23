//
//  QuoteTableViewCell.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class QuoteTableViewCell: BaseTableViewCell {
    
    // UI parameters
    static let xPadding:CGFloat = 30
    
    
    let titleLabel:UILabel
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))
        titleLabel.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.font = UIFont(name: "PlayfairDisplay-BoldItalic", size: 20)
        titleLabel.textColor = UIColor.whiteColor()
        addSubview(titleLabel)
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
    
    func setContentValue(quote:Quote){
        
        // This would cause a crash if profileSummary images are nil!
        // fatal error: unexpectedly found nil while unwrapping an Optional value
        titleLabel.text = quote.title
        backgroundImageView.image = quote.backgroundImage
    }

    
    
    class func cellHeight(object:AnyObject)->CGFloat {
        let readyObject = object as! Quote
        
        return 150.0+xPadding
    }

}
