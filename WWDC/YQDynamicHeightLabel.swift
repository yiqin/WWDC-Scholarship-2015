//
//  YQDynamicHeightLabel.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class YQDynamicHeightLabel: UILabel {
    
    var yPadding:CGFloat = 2
    
    var maxNumberOfLine:Int = 0
    
    init(){
        super.init(frame: CGRectZero)
    }
    
    func update(frame:CGRect, font:UIFont, text:String) {
        
        self.font = font
        self.text = text
        numberOfLines = 0
        let maxHeight:CGFloat = 1024.0
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, maxHeight)
        sizeToFit()
        var labelHeight:CGFloat = self.frame.size.height
        
        if maxNumberOfLine > 0 {
            let tempLabel = UILabel(frame: frame)
            tempLabel.font = font
            tempLabel.text = "One"
            tempLabel.sizeToFit()
            if (labelHeight > tempLabel.frame.size.height*CGFloat(maxNumberOfLine)) {
                labelHeight = tempLabel.frame.size.height*CGFloat(maxNumberOfLine)
            }
            
        }
        
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, labelHeight+2*yPadding)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
