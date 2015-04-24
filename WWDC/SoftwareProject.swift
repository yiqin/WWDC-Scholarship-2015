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
    var subtitle:String
    
    var descriptionPoint:[String] = []
    
    var projectImage:UIImage?
    
    init(title:String, subtitle:String, projectImage:UIImage?) {
        self.title = title
        self.subtitle = subtitle
        self.projectImage = projectImage!
        super.init()
    }
    
    override init() {
        title = ""
        projectImage = UIImage()
        subtitle = ""
        super.init()
    }
    
    func addDescription(description:String){
        descriptionPoint += [description]
    }

}
