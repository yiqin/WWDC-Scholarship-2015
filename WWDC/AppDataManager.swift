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
        app1.iconImage = UIImage(named: "allpick")
        app1.tag = 0
        app1.urlString = "https://itunes.apple.com/us/app/allpick/id698213315?mt=8"
        
        app1.moreDetail = "This is my first iOS app. It's a food delivery app for students at Purdue. I spent 7 months to finish the first version and spent another two months to get my first user. I have successfully made the number of active daily users grow up to 200."
        
        let app2 = App()
        app2.title = "1337Coding - Review Coding Interview Questions"
        app2.iconImage = UIImage(named: "1337Coding")
        app2.tag = 1
        app2.urlString = "https://itunes.apple.com/us/app/1337coding-review-coding-interview/id963066061?mt=8"
        
        app2.moreDetail = "I want to help my friends and me to prepare tech interviews in a more convenient way. So I created 1337Coding to let you review coding interview questions in your phone. "
        
        let app3 = App()
        app3.title = "Git Inspired - the best inspiring open source projects, every day."
        app3.iconImage = UIImage(named: "gitinspired")
        app3.tag = 2
        app3.urlString = "https://itunes.apple.com/us/app/git-inspired-best-inspiring/id953710137?mt=8"
        
        app3.moreDetail = "The reason that we will go through open source projects is to get inspired, instead of to use these code in our projects. We want to 100% control our codes. Git Inspired focuses on how to make developers get inspired from open source projects."
        
        
        apps = [app1, app2, app3]
    }
    
}
