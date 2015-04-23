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
    var subTitle:String
    
    var projectImage:UIImage
    
    init(title:String, subTitle:String, projectImage:UIImage) {
        self.title = title
        self.subTitle = subTitle
        self.projectImage = projectImage
        super.init()
    }
    
    override init() {
        title = ""
        projectImage = UIImage()
        super.init()
    }

}
