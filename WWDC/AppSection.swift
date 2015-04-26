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
        
        let contentApp = Content(title: "I just would like to make an iOS app that my friends that can use every day. So I began to learn iOS in two years ago. Now I have 9 apps on App Store. Each of them has it own story. Four of them are in Swift.")
        
        let app1 = App()
        
        app1.isLastOne = true
        rowObjects = [contentApp, app1]
    }
}
