//
//  YQViewController.swift
//  WWDC
//
//  Created by Yi Qin on 4/22/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SoftwareProjectTableViewCellDelegate, AppTableViewCellDelegate {
    
    let profileSummaryCellIdentifier = "profileSummaryCellIdentifier"
    let contentCellIdentifier = "contentCellIdentifier"
    let quoteCellIdentifier = "quoteCellIdentifier"
    let softwareProjectCellIdentifier = "softwareCellIdentifier"
    let appCellIdentifier = "AppCellIdentifier"
    let imageSetCellIdentifier = "ImageSetCellIdentifier"
    
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
        backgroundImageScrollView.backgroundColor = UIColor.whiteColor()
        
        
        
        backgroundImageScrollView.frame = CGRectMake(0, 0, screenWidth, 550.0)
        backgroundImageScrollView.scrollEnabled = false
        backgroundImageScrollView.contentSize = CGSizeMake(screenWidth, 680)
        
        let tempBackgroundImageView = UIImageView(frame: CGRectMake(0, -200, screenWidth, 520))
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
        taglineLabel.textAlignment = NSTextAlignment.Center
        backgroundImageScrollView.addSubview(taglineLabel)
        
        // taglineLabel.backgroundColor = UIColor.yellowColor()
        
        
        nameLabel.text = "  Yi   Qin".uppercaseString
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.frame = CGRectMake(0, 160-26, screenWidth, 26)// CGRectMake(screenWidth*0.5-taglineLabelWidth*0.5, 160-26, 200, 26)
        nameLabel.font = UIFont(name: "Lato-Semibold", size: 20.0)
        nameLabel.textColor = UIColor.whiteColor()
        backgroundImageScrollView.addSubview(nameLabel)
        

        
        tableView.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))
        tableView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        tableView.backgroundColor = UIColor.clearColor()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
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
            tableView.backgroundColor = UIColor.clearColor()
            
            let yContent = tableView.contentOffset.y// -64*2
            backgroundImageScrollView.contentOffset = CGPointMake(0, yContent*0.5)
            // println(yContent)
        }
        else {
            tableView.backgroundColor = UIColor.whiteColor()
        }
        
        let selectedDateDictionary = ["yContent": tableView.contentOffset.y]
        NSNotificationCenter.defaultCenter().postNotificationName("updateMove", object: nil, userInfo: selectedDateDictionary)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ResumeDataManager.shareInstance.getNumberOfSections()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ResumeDataManager.shareInstance.getNumberOfRows(section)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let cellClassName = ResumeDataManager.shareInstance.getCellClass(section)
        
        switch cellClassName {
            case "WWDC.ProfileSummarySection":
                return 0
            case "WWDC.QuoteSection":
                return 0
            case "WWDC.BlankSection":
                return 0
            default:
                return 44
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ResumeDataManager.shareInstance.getHeight(indexPath)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 44))
        headView.backgroundColor = UIColor.whiteColor()
        
        let headLabel = UILabel(frame: CGRectMake(15, 0, CGRectGetWidth(headView.frame), CGRectGetHeight(headView.frame)))
        headLabel.font = SoftwareProjectTableViewCellSetting.getHeaderLabelFont()
        headLabel.textColor = UIColor.blackColor()
        headView.addSubview(headLabel)
        
        let baseSection = ResumeDataManager.shareInstance.objects.objectAtIndex(section) as! BaseSection
        headLabel.text = baseSection.text.uppercaseString
        
        
        let lineView = UIView(frame: CGRectMake(15, CGRectGetHeight(headLabel.frame)-10, 50, 2.0))
        lineView.backgroundColor = UIColor.blackColor()
        headView.addSubview(lineView)
        
        
        if baseSection.text == "App Gallexy" {
            let seeAllButton:UIButton = UIButton(type: UIButtonType.System)
            seeAllButton.addTarget(self, action: "pressedButton:", forControlEvents: UIControlEvents.TouchUpInside)
            seeAllButton.setTitleColor(lightBlue, forState: UIControlState.Normal)
            seeAllButton.titleLabel?.numberOfLines = 1
            seeAllButton.titleLabel?.font = SoftwareProjectTableViewCellSetting.getDescriptionLabelFont()
            
            seeAllButton.setTitle("see all", forState: UIControlState.Normal)
            seeAllButton.frame = CGRectMake(CGRectGetWidth(headView.frame)-100-15, 0, 100, CGRectGetHeight(headView.frame))
            seeAllButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
            
            headView.addSubview(seeAllButton)
            
        }
        
        return headView
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("cellForRowAtIndexPath \(indexPath)")
        
        let object: AnyObject = ResumeDataManager.shareInstance.getObject(indexPath)
        let klass:AnyClass = object_getClass(object)
        let cellClassName = NSStringFromClass(klass)
                
        switch cellClassName {
            case "WWDC.ProfileSummary":
                return getProfileSummaryTableViewCell(indexPath)
            case "WWDC.Quote":
                return getQuoteTableViewCell(indexPath)
            case "WWDC.SoftwareProject":
                return getSoftwareProjectTableViewCell(indexPath)
            case "WWDC.Content":
                return getContentTableViewCell(indexPath)
            case "WWDC.App":
                return getAppTableViewCell(indexPath)
            case "WWDC.Blank":
                return BlankTableViewCell()
            case "WWDC.ImageSet":
                return getImageSetTableViewCell(indexPath)
            default:
                return UITableViewCell()
        }
    }
    
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        print("willDisplayCell \(indexPath) \n")
        
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        // Load the first datq...
        // just for the WWDC.ImageSet.....
        
        // this is called in the main thread.
        // so we need to put into GCD...
        
        // each image to one dispatch_get_global_queue
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
        cell?.setContentValue(object, setupYContent:tableView.contentOffset.y)
        
        return cell!
    }
    
    func getSoftwareProjectTableViewCell(indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(softwareProjectCellIdentifier) as? SoftwareProjectTableViewCell
        if cell == nil {
            cell = SoftwareProjectTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: softwareProjectCellIdentifier)
        }
        let object: AnyObject = ResumeDataManager.shareInstance.getObject(indexPath)
        cell?.setContentValue(object)
        cell?.delegate = self
        
        return cell!
    }
    
    func getAppTableViewCell(indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(appCellIdentifier) as? AppTableViewCell
        if cell == nil {
            cell = AppTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: appCellIdentifier)
        }
        let object: AnyObject = ResumeDataManager.shareInstance.getObject(indexPath)
        cell?.setContentValue(object)
        cell?.delegate = self
        
        return cell!
    }
    
    func getImageSetTableViewCell(indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(imageSetCellIdentifier) as? ImageSetTableViewCell
        if cell == nil {
            cell = ImageSetTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: imageSetCellIdentifier)
        }
        let object: AnyObject = ResumeDataManager.shareInstance.getObject(indexPath)
        // MARK: - this is reason that the scrolling frozes.
        cell?.setContentValue(object)
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func openLink(urlString: String, title:String) {
        let vc = WebDetailViewController(nibName: nil, bundle: nil)
        vc.urlString = urlString
        vc.title = title.uppercaseString
        
        let webDetailNavigationController = WebDetailNavigationController(rootViewController: vc)
        navigationController?.presentViewController(webDetailNavigationController, animated: true, completion: { () -> Void in
            
        })
    }
    
    func openAppLink(urlString: String, title: String) {
        let alertController = UIAlertController(title: title, message: "You are leaving the app to App Store to install the app.", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Back", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Go", style: .Default) { (action) in
            // ...
            let urlString = urlString
            let url = NSURL(string:urlString)
            UIApplication.sharedApplication().openURL(url!)
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    func pressedButton(sender:UIButton!) {
        let alertController = UIAlertController(title: "See All", message: "You are leaving the app to App Store.", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Back", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Go", style: .Default) { (action) in
            // ...
            let urlString = "http://itunes.apple.com/us/artist/yi-qin/id698213318"
            let url = NSURL(string:urlString)
            UIApplication.sharedApplication().openURL(url!)
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
}
