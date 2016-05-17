//
//  WebViewController.swift
//  AP Calculus
//
//  Created by Arshin Jain on 4/10/16.
//  Copyright © 2016 Tibbit. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "http://media.collegeboard.com/digitalServices/pdf/ap/ap-calculus-course-description.pdf")
        let requestObj = NSURLRequest(URL:url!)
        myWebView.loadRequest(requestObj)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //code to do navigation in the web view
    @IBAction func back(sender:AnyObject) {
        if myWebView.canGoBack{
            myWebView.goBack()
        }
    }
    
    @IBAction func forward(sender:AnyObject) {
        if myWebView.canGoForward{
            myWebView.goForward()
        }
    }


}
