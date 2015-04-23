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
    
    
    var tableView: UITableView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        tableView = UITableView()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = UIColor.whiteColor()
        
        tableView.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))
        tableView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        tableView.backgroundColor = UIColor.clearColor()
        
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
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return 1
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch(indexPath.section){
        case 0:
            return ProfileSummaryTableViewCell.cellHeight()
        default:
            return 0
        }
    }
    
    /*
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 44))
        headView.backgroundColor = UIColor.clearColor()
        let headLabel = UILabel(frame: CGRectMake(16, 0, CGRectGetWidth(headView.frame), CGRectGetHeight(headView.frame)))
        headLabel.text = "Difficulty Level".uppercaseString
        headLabel.font = UIFont(name: "OpenSans-Bold", size: 13.0)
        headView.addSubview(headLabel)
        return headView
    }
    */
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(profileSummaryCellIdentifier) as? ProfileSummaryTableViewCell
        if cell == nil {
            cell = ProfileSummaryTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: profileSummaryCellIdentifier)
        }
        return cell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
}
