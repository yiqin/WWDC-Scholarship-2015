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
        

        let quote1 = Quote(text: "Keep Building", backgroundImage: UIImage(named: "backgroundImage1")!)
        var quoteSection1 = QuoteSection()
        quoteSection1.rowObjects = [quote1]
        
        
        let quote2 = Quote(text: "Brace Yourself", backgroundImage: UIImage(named: "profileBackgroundImage1")!)
        var quoteSection2 = QuoteSection()
        quoteSection2.rowObjects = [quote2]
        
        
        let quote3 = Quote(text: "Know a good idea when you see it.", backgroundImage: UIImage(named: "backgroundImage3")!)
        var quoteSection3 = QuoteSection()
        quoteSection3.rowObjects = [quote3]
        
        
        let quote4 = Quote(text: "The world we live in is dynamic.", backgroundImage: UIImage(named: "backgroundImage4")!)
        var quoteSection4 = QuoteSection()
        quoteSection4.rowObjects = [quote4]
        
        
        let quote5 = Quote(text: "Think Different", backgroundImage: UIImage(named: "backgroundImage10")!)
        var quoteSection5 = QuoteSection()
        quoteSection5.rowObjects = [quote5]
        
        
        
        let content1 = Content(title: "I enjoy hacking. I love the hacker culture. \n\nI was born in China. Three years ago, I came to U.S to pursue my dream of becoming a mechanical engineer. \n\nI accidently went to a hackathon with 500+ hackers in Juanary 2014. I was shocked by the passion and the creativity of programmers who were from all over the country. After that, I changed my mind and I spent more and more time on iOS development. \n\nNow I'm studying Computer Science at University of Chicago and I'm becoming an iOS developer.")
        let contentSection1 = ContentSection()
        contentSection1.text = "About me"
        
        // content1.isLastOne = true
        contentSection1.rowObjects = [content1]
        
        
        
        let softwareProject1 = SoftwareProject(title: "Lead iOS Developer, at FireStop Inc",subtitle: "June 2014 - December 2014", projectImage: UIImage(named: "firestop1"))
        softwareProject1.descriptionPoint = ["FireStop is a cloud based response software that enables firefighters to leverage critical data in real time when responding to emergencies.","I'm responsible for iOS development. We want to arm firefighters with iPads to access real-time data analytics."]
        softwareProject1.urlString = "http://www.firestopapp.com/"
        softwareProject1.shortTitle = "firestop"
        
        
        var softwareProjectSection1 = SoftwareProjectSection()
        softwareProjectSection1.text = "Experience"
        
        softwareProject1.isLastOne = true
        softwareProjectSection1.rowObjects = [softwareProject1]
        
        
        
        let hackathonConent = Content(title: "I have been really lucky to attend 14 premier hackathons since 2014. I have received 14 awards from Apple, Facebook, Parse.com, Qualcomm, Evernote, Mashery, Kimono Labs and more. The hackathon is like a mini-WWDC, which privdes where I get a chance to talk to engineers From Apple and learn new things from them. ")
        
        
        let hackathonImageSet = ImageSet()
        hackathonImageSet.pageImages = [UIImage(named: "image2"), UIImage(named: "image1"), UIImage(named: "image3"),UIImage(named: "image4"),UIImage(named: "image5")]
        
        
        let hackathon1 = SoftwareProject(title: "Leaftagger (Best Use of Parse from Facebook and Best iOS app from Apple at MHacks f2014)",subtitle: "1000+ Hackers, September 2014", projectImage: UIImage(named: "leaftagger1")!)
        hackathon1.descriptionPoint = ["Leaftagger is an iOS framework to get feedback from users directly in the native iOS app, which untimately enables developers to iterate and launch the app quicker.","Leaftagger allows developers to communicate with their users through your app without more messy emails back and forward."]
        hackathon1.urlString = "http://www.leaftagger.com/"
        hackathon1.shortTitle = "leaftagger"
        
        
        // Hide this one. Apple Engineer don't like Bitcoin...
        let hackathon2 = SoftwareProject(title: "O2: iOS SDK for Bitcoin (Best Bitcoin Hack by Coinbase at PennApps X f2014)",subtitle: "1200+ Hackers, September 2014", projectImage: UIImage(named: "bitcoin1")!)
        hackathon2.descriptionPoint = ["O2 is the world’s first fully integreated Bitcoin rewarding API helping companies and developers to increase user retention, which can be implemented by one-line of code."]
        hackathon2.urlString = "http://www.bito2.org/"
        hackathon2.shortTitle = "O2: iOS SDK for Bitcoin"
        
        
        let hackathon3 = SoftwareProject(title: "EVOO (Kimono Labs Award at Y Combinator Hackathon 2014)",subtitle: "500+ Hackers, August 2014", projectImage: UIImage(named: "evoo1")!)
        hackathon3.descriptionPoint = ["EVOO is an iOS app that lets people quickly discover and plan meals for diverse dietary needs.","It utilized Kimono to turn recipes and cookbooks websites into structured APIs."]
        hackathon3.urlString = "http://challengepost.com/software/evoo"
        hackathon3.shortTitle = "EVOO"
        
        
        let hackathon4 = SoftwareProject(title: "Little Feat (Best iOS App from Apple at Purdue BoilerMake Hackathon w2014)", subtitle: "500+ Hackers, February 2014", projectImage: UIImage(named: "littleFeat1@3x"))
        hackathon4.descriptionPoint = ["Little Feat is a facial recognition + augmented reality iOS game where the player could control the pengiun in the game to interact with humans in the live camera video view."]
        hackathon4.urlString = "http://challengepost.com/software/little-feet"
        hackathon4.shortTitle = "Little Feat"
        
        
        let hackathonSection = SoftwareProjectSection()
        hackathonSection.text = "Hackathons"
        
        hackathon4.isLastOne = true
        hackathonImageSet.isLastOne = true
        hackathonSection.rowObjects = [hackathonConent, hackathonImageSet, hackathon1, hackathon2, hackathon3, hackathon4]
        
        
        
        
        
        let openSourceContent = Content(title: "How to improve the quality of my code is a necessary lession I spend a lot of time to learn. My solution is to make contribution to open source projects.")
        
        let openSource1 = SoftwareProject(title: "YQParse", subtitle: "September 2014", projectImage: UIImage(named: "YQParse2")!)
        openSource1.descriptionPoint = ["YQParse is a Parse iOS SDK totally based on REST, which lets you interact Parse.com with a HTTP request, including saving objects and retrieving objects.", "YQParse makes it much easier to buld a backend for your own iOS SDK."]
        openSource1.urlString = "http://github.com/yiqin/YQParse"
        openSource1.shortTitle = "YQParse"
        
        
        let openSource2 = SoftwareProject(title: "Yo iOS SDK", subtitle: "July 2014", projectImage: UIImage(named: "Yo1")!)
        openSource2.descriptionPoint = ["Yo is a social application to send the user's friends the word \"Yo\" as a text and audio notification", "Yo iOS SDK allows developers to send a \"Yo\" with a single line of code in Xcode."]
        openSource2.urlString = "http://github.com/yiqin/YO-iOS-SDK"
        openSource2.shortTitle = "Yo iOS SDK"
        
        
        let openSource3 = SoftwareProject(title: "Plants-vs-Zombies", subtitle: "December 2014", projectImage: UIImage(named: "plant1")!)
        openSource3.descriptionPoint = ["A mob of fun-loving zombies is about to invade your home. Use peashooters to defense. ", "The game is written in Java from scratch."]
        openSource3.urlString = "http://github.com/yiqin/Plants-vs-Zombies"
        openSource3.shortTitle = "Plants-vs-Zombies"
        
        
        let openSourceSection = SoftwareProjectSection()
        openSourceSection.text = "Open Source Projects"
        
        openSource2.isLastOne = true
        openSourceSection.rowObjects = [openSourceContent, openSource3, openSource1, openSource2]
        
        
        
        let educationContent = Content(title: "Three year ago, I came to U.S to pursue my phd in Mechanical Engineering.")
        
        let education1 = SoftwareProject(title: "The University of Chicago", subtitle: "Master of Science, Computer Science\nSeptember 2014 - expected December 2015")
        education1.descriptionPoint = ["Learning the nature and fundamentals of Computer Science (algorithm and data structure)."]
        
        let education2 = SoftwareProject(title: "Purdue University", subtitle: "Master of Science, Mechanical Engineering\nAugust 2011 - June 2014")
        education2.descriptionPoint = ["Focused on designing software and hardware for biologically inspired robots, especially flying insect robots and humanoid robots."]
        
        let education3 = SoftwareProject(title: "Shanghai Jiao Tong Unviersity", subtitle: "Bachelor of Science, Mechanical Engineering\nSeptember 2007 - June 2011")
        education3.descriptionPoint = ["Completed undergraduate honors thesis on design of flapping wing micro air vehicles."]
        
        
        let educationSection = SoftwareProjectSection()
        educationSection.text = "Education"
        
        education3.isLastOne = true
        educationSection.rowObjects = [educationContent, education1, education2, education3]
        
        
        
        
        let robotContent = Content(title: "I also build robots. I focused on designing software and hardware for biologically inspired robots, especially flying insect robots and humanoid robots.")
        
        let robotImageSet = ImageSet()
        robotImageSet.pageImages = [UIImage(named: "robot1"), UIImage(named: "robot2"), UIImage(named: "robot3"), UIImage(named: "robot4")]
        
        
        let robotSection = SoftwareProjectSection()
        robotSection.text = "Robotics"
        
        robotImageSet.isLastOne = true
        robotSection.rowObjects = [robotContent, robotImageSet]
        
        
        objects = NSArray(array: [profileSummarySection, BlankSection(), contentSection1, BlankSection(), AppSection(), BlankSection(), quoteSection1, BlankSection(), softwareProjectSection1, BlankSection(), quoteSection2, BlankSection(), hackathonSection, BlankSection(), quoteSection3, BlankSection(), openSourceSection, BlankSection(), quoteSection4, BlankSection(),educationSection,BlankSection(),robotSection,BlankSection(), quoteSection5])
        
        super.init()
    }
    
    func getCellClass(sectionIndex: Int) -> NSString {
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
        let object: AnyObject = ResumeDataManager.shareInstance.getObject(indexPath)
        var klass:AnyClass = object_getClass(object)
        let cellClassName = NSStringFromClass(klass)
        
        switch cellClassName {
            case "WWDC.ProfileSummary":
                return ProfileSummaryTableViewCell.cellHeight()
            case "WWDC.Quote":
                return QuoteTableViewCell.cellHeight(object)
            case "WWDC.SoftwareProject":
                return SoftwareProjectTableViewCell.cellHeight(object)
            case "WWDC.Content":
                return ContentTableViewCell.cellHeight(object)
            case "WWDC.App":
                return AppTableViewCell.cellHeight(object)
            case "WWDC.Blank":
                return BlankTableViewCell.cellHeight()
            case "WWDC.ImageSet":
                return ImageSetTableViewCell.cellHeight(object)
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
