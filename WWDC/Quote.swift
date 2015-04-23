//
//  Quote.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    var title:String
    var backgroundImage:UIImage
    
    
    init(text:String, backgroundImage:UIImage) {
        self.title = text
        self.backgroundImage = backgroundImage
        super.init()
    }
    
    override init() {
        title = ""
        backgroundImage = UIImage()
        super.init()
    }
}
