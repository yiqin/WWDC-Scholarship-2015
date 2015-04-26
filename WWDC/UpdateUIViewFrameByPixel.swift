//
//  UpdateUIViewByPixel.swift
//  WWDC
//
//  Created by Yi Qin on 4/26/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    
    func moveY(yOffset:CGFloat) {
        frame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame)+yOffset, CGRectGetWidth(frame), CGRectGetHeight(frame))
    }
    
    func moveX(xOffset:CGFloat) {
        frame = CGRectMake(CGRectGetMinX(frame)+xOffset, CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame))
    }
    
}