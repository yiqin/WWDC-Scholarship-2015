//
//  SoftwareProject.swift
//  WWDC
//
//  Created by Yi Qin on 4/23/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class SoftwareProject: NSObject {
    
    var title:String
    var projectImage:UIImage
    
    init(text:String, projectImage:UIImage) {
        self.title = text
        self.projectImage = projectImage
        super.init()
    }
    
    override init() {
        title = ""
        projectImage = UIImage()
        super.init()
    }

}
