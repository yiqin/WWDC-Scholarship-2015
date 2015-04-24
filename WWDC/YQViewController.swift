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
    let contentCellIdentifier = "contentCellIdentifier"
    let quoteCellIdentifier = "quoteCellIdentifier"
    let softwareProjectCellIdentifier = "softwareCellIdentifier"
    
    
    var tableView: UITableView = UITableView()
    
    // Profile Scroll View
    var backgroundImageScrollView:UIScrollView = UIScrollView()
    
    let profileBackgroundImageView:UIView = UIView()
    let profileImageView:UIImageView = UIImageView()
    
    let nameLabel: UILabel = UILabel()
    let taglineLabel: UILabel = UILabel()
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = UIColor.whiteColor()
        
        
        // backgroundImageScrollView.backgroundColor = UIColor.yellowColor()
        
        
        
        backgroundImageScrollView.frame = CGRectMake(0, 0, screenWidth, 550.0)
        backgroundImageScrollView.scrollEnabled = false
        backgroundImageScrollView.contentSize = CGSizeMake(screenWidth, 680)
        
        let tempBackgroundImageView = UIImageView(frame: CGRectMake(0, -200, screenWidth, 500))
        tempBackgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
        tempBackgroundImageView.image = UIImage(named: "profileBackgroundImage2")
        
        backgroundImageScrollView.addSubview(tempBackgroundImageView)
        view.addSubview(backgroundImageScrollView)
        
        
        let profileImageSize:CGFloat = 90
        
        profileBackgroundImageView.frame = CGRectMake(screenWidth*0.5-(profileImageSize+4)*0.5, 34, profileImageSize+4, profileImageSize+4)
        profileBackgroundImageView.layer.cornerRadius = CGRectGetWidth(profileBackgroundImageView.frame)*0.5
        profileBackgroundImageView.backgroundColor = UIColor.whiteColor()
        backgroundImageScrollView.addSubview(profileBackgroundImageView)
        
        profileImageView.frame = CGRectMake(screenWidth*0.5-profileImageSize*0.5, 36, profileImageSize, profileImageSize)
        profileImageView.layer.cornerRadius = CGRectGetWidth(profileImageView.frame)*0.5
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        backgroundImageScrollView.addSubview(profileImageView)
        profileImageView.image = ProfileSummary().profileImage
        
        
        
        
        let taglineLabelWidth:CGFloat = 165
        taglineLabel.text = "I build iOS apps and robots"
        taglineLabel.frame = CGRectMake(screenWidth*0.5-taglineLabelWidth*0.5, 160, taglineLabelWidth, 24)
        taglineLabel.font = UIFont(name: "PlayfairDisplay-BoldItalic", size: 13)
        taglineLabel.textColor = UIColor.whiteColor()
        backgroundImageScrollView.addSubview(taglineLabel)
        
        // taglineLabel.backgroundColor = UIColor.yellowColor()
        
        
        nameLabel.text = "Yi Qin".uppercaseString
        nameLabel.frame = CGRectMake(screenWidth*0.5-taglineLabelWidth*0.5, 160-26, 200, 26)
        nameLabel.font = UIFont(name: "Lato-Semibold", size: 17.0)
        nameLabel.textColor = UIColor.whiteColor()
        backgroundImageScrollView.addSubview(nameLabel)
        
        
        
        
        
        
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
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if tableView.contentOffset.y <= ProfileSummaryTableViewCell.cellHeight() {
            
            let yContent = tableView.contentOffset.y// -64*2
            backgroundImageScrollView.contentOffset = CGPointMake(0, yContent*0.5)
            println(yContent)
            
            // var selectedDateDictionary = ["yContent": tableView.contentOffset.y]
            // NSNotificationCenter.defaultCenter().postNotificationName("updateMove", object: nil, userInfo: selectedDateDictionary)
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
        case "WWDC.ContentSection":
            return getContentTableViewCell(indexPath)
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
    
    func getContentTableViewCell(indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(contentCellIdentifier) as? ContentTableViewCell
        if cell == nil {
            cell = ContentTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: contentCellIdentifier)
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
