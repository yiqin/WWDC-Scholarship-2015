//
//  AppDataManager.swift
//  WWDC
//
//  Created by Yi Qin on 4/26/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

public class AppDataManager: NSObject {
    
    public static let shareInstance = AppDataManager()
    
    var apps:[App] = []
    
    override init() {
        super.init()
        
        let app1 = App()
        app1.title = "Allpick - Groupon Food Delivery"
        
        let app2 = App()
        app2.title = "LeetCoding - Review Coding Interview Questions"
        
        let app3 = App()
        app3.title = "Git Inspired - the best inspiring open source projects, every day."
        
        
        apps = [app1, app2, app3]
    }
    
}
