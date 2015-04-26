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
        
        let contentApp = Content(title: "Two year ago, I just would like to make an iOS app that my friends that can use every day. Then I begin to learn iOS. Now I have 9 apps on App Store. Each of them has it own story. Four of them are in Swift.")
        
        let app1 = App()
        rowObjects = [contentApp, app1]
    }
}
