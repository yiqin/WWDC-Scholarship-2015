//
//  AnimationManager.swift
//  WWDC
//
//  Created by Yi Qin on 4/26/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

public class AnimationManager: NSObject {
    public static let shareInstance = AnimationManager()
    
    
    // animation lists.
    var viewForHeaderInSectionList : NSMutableSet = NSMutableSet()
    
    public static let viewForHeaderInSectionDelay:NSTimeInterval = 0.2
    public static let viewForHeaderInSectionDuration:NSTimeInterval = 0.2
    
    func checkViewForHeaderInSection(baseSection:BaseSection)->Bool {
        return viewForHeaderInSectionList.containsObject(baseSection)
    }
    
    func addViewForHeaderInSection(baseSection:BaseSection) {
        viewForHeaderInSectionList.addObject(baseSection)
    }
    
    
    
    // animation lists.
    var regularList : NSMutableSet = NSMutableSet()
    
    public static let regularInitAlpha:CGFloat = 0.3
    public static let regularYOffset:CGFloat = 6.0
    
    public static let regularDelay:NSTimeInterval = 0.3
    public static let regularDuration:NSTimeInterval = 0.3

    
    func checkRegular(text:String)->Bool {
        return regularList.containsObject(text)
    }
    
    func addRegular(text:String) {
        regularList.addObject(text)
    }
    
    var guideHelper:Bool = true
    
    func checkGuide()->Bool {
        return guideHelper
    }
    
    func updateGuideHelper(){
        guideHelper = false
    }
    

}
