//
//  Content.swift
//  WWDC
//
//  Created by Yi Qin on 4/24/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class Content: NSObject {
    
    var title:String = ""
    var isLastOne:Bool = false
    
    override init() {
        super.init()
    }
    
    init(title:String) {
        super.init()
        self.title = title
    }

}
