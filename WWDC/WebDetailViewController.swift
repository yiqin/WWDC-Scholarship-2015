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
    var progressView: UIProgressView!
    
    var urlString:String = ""
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        webView = WKWebView()
        progressView = UIProgressView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    deinit {
        removeWebViewObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        let height = NSLayoutConstraint(item: webView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: webView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
        view.addConstraints([height, width])
        
        let url = NSURL(string:urlString)
        let request = NSURLRequest(URL:url!)
        webView.loadRequest(request)
        
        
        progressView.frame = CGRectMake(0, 64, screenWidth, 3)
        progressView.tintColor = UIColor.blackColor()
        view.addSubview(progressView)
        view.insertSubview(webView, belowSubview: progressView)
        
        
        let backButton = UIBarButtonItem(image: UIImage(named: "back_web"), style: UIBarButtonItemStyle.Plain, target: self, action: "pressedBackButton")
        navigationItem.leftBarButtonItem = backButton
        
        addWebViewObserver()
    }
    
    func addWebViewObserver(){
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
    }
    
    func removeWebViewObserver(){
        webView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<()>) {
        if (keyPath == "estimatedProgress") {
            progressView.hidden = webView.estimatedProgress == 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }
    
    func pressedBackButton() {
        
        navigationController!.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
}
