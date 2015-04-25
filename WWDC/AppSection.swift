//
//  AppSection.swift
//  WWDC
//
//  Created by Yi Qin on 4/25/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class AppSection: BaseSection {
    
    
    override init() {
        super.init()
        
        // Create App here...
        text = "App Gallexy"
        
        let app1 = App()
        
        let app2 = App()
        
        rowObjects = [app1, app2]
    }
    
    

}
