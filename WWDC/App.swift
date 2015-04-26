//
//  App.swift
//  WWDC
//
//  Created by Yi Qin on 4/25/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class App: NSObject {
    
    var title:String = ""
    var moreDetail:String = ""
    
    var iconImage:UIImage? = UIImage()
    var tag:Int = 0
    var urlString:String = ""
    
    
    var isLastOne:Bool = false
    
    override init() {
        super.init()
    }

}
