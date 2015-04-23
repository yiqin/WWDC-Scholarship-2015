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
        let quote2 = Quote(text: "Brace Yourself", backgroundImage: UIImage(named: "backgroundImage2")!)
        
        var quoteSection1 = QuoteSection()
        quoteSection1.rowObjects = [quote1]
        
        var quoteSection2 = QuoteSection()
        quoteSection2.rowObjects = [quote2]
        
        
        let softwareProject1 = SoftwareProject(title: "Lead iOS Developer, at FireStop Inc",subtitle: "June 2014 - December 2014", projectImage: UIImage())
        
        
        var softwareProjectSection1 = SoftwareProjectSection()
        softwareProjectSection1.rowObjects = [softwareProject1]
        
        
        objects = NSArray(array: [profileSummarySection, quoteSection1, softwareProjectSection1,quoteSection2, quoteSection1])
        
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
        return baseSection.rowNumber
    }
    
    func getHeight(indexPath: NSIndexPath) -> CGFloat {
        let cellClassName = ResumeDataManager.shareInstance.getCellClass(indexPath)
        
        switch cellClassName {
            
        case "WWDC.ProfileSummarySection":
            let baseSection = objects.objectAtIndex(indexPath.section) as! ProfileSummarySection
            return ProfileSummaryTableViewCell.cellHeight(baseSection.rowObjects[indexPath.row])
            
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
