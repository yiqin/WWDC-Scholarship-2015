//
//  ResumeDataManager.swift
//  WWDC
//
//  Created by Yi Qin on 4/22/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

public class ResumeDataManager: NSObject {
    
    public static let shareInstance = ResumeDataManager()
    
    var quotes:[Quote] = []
    
    var objects:NSArray
    
    override init() {
        
        // Make resume here....
        let profileSummarySection = ProfileSummarySection()
        
        // Force wrapping....
        let quote1 = Quote(text: "Keep Building", backgroundImage: UIImage(named: "backgroundImage1")!)
        let quote2 = Quote(text: "Brace Yourself", backgroundImage: UIImage(named: "profileBackgroundImage1")!)
        
        var quoteSection1 = QuoteSection()
        quoteSection1.rowObjects = [quote1]
        
        var quoteSection2 = QuoteSection()
        quoteSection2.rowObjects = [quote2]
        
        
        let softwareProject1 = SoftwareProject(title: "Lead iOS Developer, at FireStop Inc",subtitle: "June 2014 - December 2014", projectImage: UIImage(named: "firestop1"))
        softwareProject1.descriptionPoint = ["FireStop is a cloud-based response software that enables firefighters to leverage critical data in real time when responding to emergencies.", "FireStop significantly reduces firefighting response and operation time to better protect lives and property through data collection, mobile software and analytics.","I'm responsible for iOS development. We want to arm firefighters with iPads and real-time data."]
        
        
        var softwareProjectSection1 = SoftwareProjectSection()
        softwareProjectSection1.rowObjects = [softwareProject1]
        
        
        let hackathon1 = SoftwareProject(title: "Leaftagger (Best Use of Parse from Facebook + Parse and Best iOS app from Apple at MHacks f2014)",subtitle: "1000+ Hackers, September 2014", projectImage: UIImage(named: "leaftagger1")!)
        hackathon1.descriptionPoint = ["Leaftagger is a powerful framework to get feedback from users directly in the native iOS app. It ultimately enables developers to iterate and launch product quicker.","Leaftagger allows developers to communicate with their users through your app without more messy emails back and forward."]
        
        
        let hackathon2 = SoftwareProject(title: "O2 : API for Bitcoin (Best Bitcoin Hack by Coinbase at PennApps X f2014)",subtitle: "1200+ Hackers, September 2014", projectImage: UIImage())
        hackathon2.descriptionPoint = ["O2 is the world's first fully integrated Bitcoin payment/reward API which can be implemented by one-line of code.","O2 is a tool for companies and developers to reward users for achievements. This not only increases user retention, but also increases the companies’ and developer’s popularity and revenue.","Our mission is to reward users for what they do on a daily basis."]
        
        let hackathon3 = SoftwareProject(title: "EVOO (Kimono Labs Award at Y Combinator Hackathon 2014)",subtitle: "500+ Hackers, August 2014", projectImage: UIImage())
        hackathon3.descriptionPoint = ["Designed an iOS app to help people quickly discover and plans meals for diverse dietary needs.","Utilized Kimono to turn recipes and cookbooks websites into structured APIs."]
        
        
        
        
        var hackathons = SoftwareProjectSection()
        hackathons.rowObjects = [hackathon1, hackathon2, hackathon3]
        
        
        objects = NSArray(array: [profileSummarySection, quoteSection1, softwareProjectSection1,quoteSection2, hackathons, quoteSection1])
        
        super.init()
    }
    
    func getCellClass(indexPath: NSIndexPath) -> NSString {
        
        let sectionIndex = indexPath.section
        let rowIndex = indexPath.row
        
        
        let object: AnyObject = ResumeDataManager.shareInstance.objects[sectionIndex]
        
        var klass:AnyClass = object_getClass(object)
        let cellClassName = NSStringFromClass(klass)
        println(cellClassName)
        
        return cellClassName
    }
    
    
    func getNumberOfSections() -> Int {
        return objects.count
    }
    
    func getNumberOfRows(section: Int)-> Int {
        let baseSection = objects.objectAtIndex(section) as! BaseSection
        return baseSection.rowObjects.count
    }
    
    func getHeight(indexPath: NSIndexPath) -> CGFloat {
        let cellClassName = ResumeDataManager.shareInstance.getCellClass(indexPath)
        
        switch cellClassName {
            
        case "WWDC.ProfileSummarySection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! ProfileSummarySection
            return ProfileSummaryTableViewCell.cellHeight()
            
        case "WWDC.QuoteSection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! QuoteSection
            return QuoteTableViewCell.cellHeight(baseSection.rowObjects[indexPath.row])
            
        case "WWDC.SoftwareProjectSection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! SoftwareProjectSection
            return SoftwareProjectTableViewCell.cellHeight(baseSection.rowObjects[indexPath.row])
            
        default:
            return 44
            
        }
    }

    func getObject(indexPath: NSIndexPath) -> AnyObject {
        let cellClassName = ResumeDataManager.shareInstance.getCellClass(indexPath)
        
        switch cellClassName {
            
        case "WWDC.ProfileSummarySection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! ProfileSummarySection
            return baseSection.rowObjects[indexPath.row]
            
        case "WWDC.QuoteSection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! QuoteSection
            if indexPath.row >= baseSection.rowObjects.count {
                return Quote()
            }
            return baseSection.rowObjects[indexPath.row]
            
        case "WWDC.SoftwareProjectSection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! SoftwareProjectSection
            if indexPath.row >= baseSection.rowObjects.count {
                return SoftwareProject()
            }
            return baseSection.rowObjects[indexPath.row]
            
        default:
            return UITableViewCell()
            
        }
    }
}
