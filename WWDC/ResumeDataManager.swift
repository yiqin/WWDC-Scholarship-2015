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
        
        
        var quoteSection1 = QuoteSection()
        quoteSection1.rowObjects = [quote1]
        
        
        let quote2 = Quote(text: "Brace Yourself", backgroundImage: UIImage(named: "profileBackgroundImage1")!)
        
        var quoteSection2 = QuoteSection()
        quoteSection2.rowObjects = [quote2]
        
        
        let quote3 = Quote(text: "Know a good idea when you see it.", backgroundImage: UIImage(named: "backgroundImage3")!)
        
        var quoteSection3 = QuoteSection()
        quoteSection3.rowObjects = [quote3]
        
        
        
        
        let content1 = Content(title: "I’m an iOS developer and a hackathon hacker. I love the hack culture.\n\nI have been really lucky to attend 14 premier hackathons since 2014. I have received 14 awards from Apple, Facebook, Parse.com, Qualcomm, Evernote, Mashery, Kimono Labs and more. I believe that the world we live in is dynamic, so I’m ready for new challenges every day.")
        let contentSection1 = ContentSection()
        contentSection1.text = "About me"
        
        content1.isLastOne = true
        contentSection1.rowObjects = [content1]
        
        
        
        let softwareProject1 = SoftwareProject(title: "Lead iOS Developer, at FireStop Inc",subtitle: "June 2014 - December 2014", projectImage: UIImage(named: "firestop1"))
        softwareProject1.descriptionPoint = ["FireStop is a cloud-based response software that enables firefighters to leverage critical data in real time when responding to emergencies.", "FireStop significantly reduces firefighting response and operation time to better protect lives and property through data collection, mobile software and analytics.","I'm responsible for iOS development. We want to arm firefighters with iPads and real-time data."]
        
        
        var softwareProjectSection1 = SoftwareProjectSection()
        softwareProjectSection1.text = "Experience"
        
        softwareProject1.isLastOne = true
        softwareProjectSection1.rowObjects = [softwareProject1]
        
        
        
        let hackathonConent = Content(title: "I have been really lucky to attend 14 premier hackathons since 2014. I have received 14 awards from Apple, Facebook, Parse.com, Qualcomm, Evernote, Mashery, Kimono Labs and more. I believe that the world we live in is dynamic, so I’m ready for new challenges every day.")
        
        let hackathon1 = SoftwareProject(title: "Leaftagger (Best Use of Parse from Facebook + Parse and Best iOS app from Apple at MHacks f2014)",subtitle: "1000+ Hackers, September 2014", projectImage: UIImage(named: "leaftagger1")!)
        hackathon1.descriptionPoint = ["Leaftagger is a powerful framework to get feedback from users directly in the native iOS app. It ultimately enables developers to iterate and launch product quicker.","Leaftagger allows developers to communicate with their users through your app without more messy emails back and forward.","Leaftagger allows developers to communicate with their users through your app without more messy emails back and forward."]
        
        
        let hackathon2 = SoftwareProject(title: "O2 : API for Bitcoin (Best Bitcoin Hack by Coinbase at PennApps X f2014)",subtitle: "1200+ Hackers, September 2014", projectImage: UIImage(named: "bitcoin1")!)
        hackathon2.descriptionPoint = ["O2 is the world's first fully integrated Bitcoin payment/reward API which can be implemented by one-line of code.","O2 is a tool for companies and developers to reward users for achievements. This not only increases user retention, but also increases the companies’ and developer’s popularity and revenue.","Our mission is to reward users for what they do on a daily basis."]
        
        
        
        let hackathon3 = SoftwareProject(title: "EVOO (Kimono Labs Award at Y Combinator Hackathon 2014)",subtitle: "500+ Hackers, August 2014", projectImage: UIImage(named: "evoo1")!)
        hackathon3.descriptionPoint = ["Designed an iOS app to help people quickly discover and plans meals for diverse dietary needs.","Utilized Kimono to turn recipes and cookbooks websites into structured APIs."]
        
        
        
        let hackathonSection = SoftwareProjectSection()
        hackathonSection.text = "Hackathons"
        
        hackathon3.isLastOne = true
        hackathonSection.rowObjects = [hackathon1, hackathon2, hackathon3]
        
        
        
        
        
        let education1 = SoftwareProject(title: "The University of Chicago", subtitle: "September 2014 - expected December 2015")
        education1.descriptionPoint = ["Learning the nature and fundamentals of Computer Science (algorithm and data structure)."]
        
        let education2 = SoftwareProject(title: "Purdue University", subtitle: "August 2011 - June 2014")
        education2.descriptionPoint = ["Focused on designing software and hardware for biologically inspired robots, especially flying insect robots and humanoid robots."]
        
        let education3 = SoftwareProject(title: "Shanghai Jiao Tong Unviersity", subtitle: "September 2007 - June 2011")
        education3.descriptionPoint = ["Completed undergraduate honors thesis on design of flapping wing micro air vehicles."]
        
        
        let educationSection = SoftwareProjectSection()
        educationSection.text = "Education"
        
        education3.isLastOne = true
        educationSection.rowObjects = [education1, education2, education3]
        
        
        
        
        objects = NSArray(array: [profileSummarySection, BlankSection(), contentSection1, BlankSection(), AppSection(), BlankSection(), quoteSection1, BlankSection(), softwareProjectSection1, BlankSection(), quoteSection2, BlankSection(), hackathonSection, BlankSection(), quoteSection3, BlankSection(),educationSection])
        
        super.init()
    }
    
    func getCellClass(sectionIndex: Int) -> NSString {
        
        // let sectionIndex = indexPath.section
        // let rowIndex = indexPath.row
        
        let object: AnyObject = ResumeDataManager.shareInstance.objects[sectionIndex]
        
        var klass:AnyClass = object_getClass(object)
        let cellClassName = NSStringFromClass(klass)
        // println(cellClassName)
        
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
        // let cellClassName = ResumeDataManager.shareInstance.getCellClass(indexPath.section)
        
        let object: AnyObject = ResumeDataManager.shareInstance.getObject(indexPath)
        var klass:AnyClass = object_getClass(object)
        let cellClassName = NSStringFromClass(klass)
        
        println(cellClassName)
        
        switch cellClassName {
            
        case "WWDC.ProfileSummary":
            let baseSection = objects.objectAtIndex(indexPath.section) as! ProfileSummarySection
            return ProfileSummaryTableViewCell.cellHeight()
            
        case "WWDC.Quote":
            let baseSection = objects.objectAtIndex(indexPath.section) as! QuoteSection
            return QuoteTableViewCell.cellHeight(object)
            
        case "WWDC.SoftwareProject":
            let baseSection = objects.objectAtIndex(indexPath.section) as! SoftwareProjectSection
            return SoftwareProjectTableViewCell.cellHeight(object)
        
        case "WWDC.Content":
            let baseSection = objects.objectAtIndex(indexPath.section) as! ContentSection
            return ContentTableViewCell.cellHeight(object)
        
        case "WWDC.App":
            let baseSection = objects.objectAtIndex(indexPath.section) as! AppSection
            return AppTableViewCell.cellHeight(object)
            
        case "WWDC.Blank":
            return BlankTableViewCell.cellHeight()
            
        default:
            return 44
            
        }
    }

    func getObject(indexPath: NSIndexPath) -> AnyObject {
        let cellClassName = ResumeDataManager.shareInstance.getCellClass(indexPath.section)
        
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
            
        case "WWDC.ContentSection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! ContentSection
            return baseSection.rowObjects[indexPath.row]
            
        case "WWDC.AppSection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! AppSection
            return baseSection.rowObjects[indexPath.row]
            
        case "WWDC.BlankSection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! BlankSection
            return baseSection.rowObjects[indexPath.row]
            
        default:
            return UITableViewCell()
            
        }
    }
}
