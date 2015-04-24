//
//  Content.swift
//  WWDC
//
//  Created by Yi Qin on 4/24/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class Content: NSObject {
    
    var text:String = ""
    
    override init() {
        super.init()
    }
    
    init(text:String) {
        super.init()
        self.text = text
    }

}
