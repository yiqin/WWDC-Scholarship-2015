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
    var image:UIImage
    
    init(text:String, image:UIImage) {
        self.title = text
        self.image = image
        super.init()
    }
    
    override init() {
        title = ""
        image = UIImage()
        super.init()
    }
}
