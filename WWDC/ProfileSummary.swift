//
//  ProfileSummary.swift
//  WWDC
//
//  Created by Yi Qin on 4/22/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class ProfileSummary: NSObject {
    
    let name:String = "Yi Qin"
    let tagline:String = "I build iOS apps and robots"
    
    // could return an optional (All UIKit)
    let profileImage:UIImage? = UIImage(named: "profileImage")
    
    let backgroundImage:UIImage = UIImage(named: "profileBackgroundImage2")!
    
    override init() {
        
        super.init()
        
    }

}
