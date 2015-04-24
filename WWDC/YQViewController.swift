//
//  YQViewController.swift
//  WWDC
//
//  Created by Yi Qin on 4/22/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class YQViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let profileSummaryCellIdentifier = "profileSummaryCellIdentifier"
    let quoteCellIdentifier = "quoteCellIdentifier"
    let softwareProjectCellIdentifier = "softwareCellIdentifier"
    
    var tableView: UITableView = UITableView()
    
    var backgroundImageScrollView:UIScrollView = UIScrollView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = UIColor.whiteColor()
        
        
        backgroundImageScrollView.frame = CGRectMake(0, 0, screenWidth, 550.0)
        backgroundImageScrollView.scrollEnabled = false
        backgroundImageScrollView.backgroundColor = UIColor.yellowColor()
        backgroundImageScrollView.contentSize = CGSizeMake(screenWidth, 680)
        
        let tempBackgroundImageView = UIImageView(frame: CGRectMake(0, -100, screenWidth, 680))
        tempBackgroundImageView.contentMode = UIViewContentMode.ScaleToFill
        tempBackgroundImageView.image = UIImage(named: "profileBackgroundImage2")
        
        backgroundImageScrollView.addSubview(tempBackgroundImageView)
        view.addSubview(backgroundImageScrollView)
        
        
        tableView.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))
        tableView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        tableView.backgroundColor = UIColor.clearColor()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var klass:AnyClass = object_getClass(self)
        println(NSStringFromClass(klass))
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let rowToReload = NSIndexPath(forRow: 0, inSection: 0)
        // tableView.reloadRowsAtIndexPaths([rowToReload], withRowAnimation: UITableViewRowAnimation.None)
        
        if tableView.contentOffset.y < 280 {
            var selectedDateDictionary = ["yContent": tableView.contentOffset.y]
            
            backgroundImageScrollView.contentOffset = CGPointMake(0, tableView.contentOffset.y*0.5)
            NSNotificationCenter.defaultCenter().postNotificationName("updateMove", object: nil, userInfo: selectedDateDictionary)
        }
        
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ResumeDataManager.shareInstance.getNumberOfSections()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ResumeDataManager.shareInstance.getNumberOfRows(section)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var temp:CGFloat = 0
        if indexPath.row == 0 && indexPath.section == 0 {
            temp = tableView.contentOffset.y
        }
        
        return ResumeDataManager.shareInstance.getHeight(indexPath)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIScrollView(frame: CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 100))
        
        headView.backgroundColor = UIColor.redColor()
        let headLabel = UILabel(frame: CGRectMake(16, 0, CGRectGetWidth(headView.frame), CGRectGetHeight(headView.frame)))
        headLabel.text = "Difficulty Level".uppercaseString
        headLabel.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        headView.addSubview(headLabel)
        
        return headView
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cellClassName = ResumeDataManager.shareInstance.getCellClass(indexPath)
        
        
        switch cellClassName {
            
        case "WWDC.ProfileSummarySection":
            return getProfileSummaryTableViewCell(indexPath)
        case "WWDC.QuoteSection":
            return getQuoteTableViewCell(indexPath)
        case "WWDC.SoftwareProjectSection":
            return getSoftwareProjectTableViewCell(indexPath)
        default:
            return UITableViewCell()
            
        }
    }
    
    func getProfileSummaryTableViewCell(indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(profileSummaryCellIdentifier) as? ProfileSummaryTableViewCell
        if cell == nil {
            cell = ProfileSummaryTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: profileSummaryCellIdentifier)
        }
        let object: AnyObject = ResumeDataManager.shareInstance.getObject(indexPath)
        
        cell?.setContentValue(object)
        
        return cell!
    }
    
    
    func getQuoteTableViewCell(indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(quoteCellIdentifier) as? QuoteTableViewCell
        if cell == nil {
            cell = QuoteTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: quoteCellIdentifier)
        }
        
        let object: AnyObject = ResumeDataManager.shareInstance.getObject(indexPath)
        
        cell?.setContentValue(object)
        
        return cell!
    }
    
    func getSoftwareProjectTableViewCell(indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(softwareProjectCellIdentifier) as? SoftwareProjectTableViewCell
        if cell == nil {
            cell = SoftwareProjectTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: softwareProjectCellIdentifier)
        }
        
        let object: AnyObject = ResumeDataManager.shareInstance.getObject(indexPath)
        
        cell?.setContentValue(object)
        
        return cell!
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
}
