//
//  DetailViewController.swift
//  WWDC
//
//  Created by Yi Qin on 4/25/15.
//  Copyright (c) 2015 Yi Qin. All rights reserved.
//

import UIKit
import WebKit

class WebDetailViewController: UIViewController {
    var webView: WKWebView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        webView = WKWebView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(webView)
        webView.setTranslatesAutoresizingMaskIntoConstraints(false)
        let height = NSLayoutConstraint(item: webView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: webView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
        view.addConstraints([height, width])
        
        let url = NSURL(string:"http://www.appcoda.com")
        let request = NSURLRequest(URL:url!)
        webView.loadRequest(request)

    }
    
}
