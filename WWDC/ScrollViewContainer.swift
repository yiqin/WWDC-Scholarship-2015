//
//  ScrollViewContainer.swift
//  WWDC
//
//  Created by Yi Qin on 4/26/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class ScrollViewContainer: UIView {
    
    
    var scrollView:UIScrollView = UIScrollView()
    
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, withEvent: event)
        
        if view == self {
            return scrollView
        }
        return view
    }
    
    
    
}
