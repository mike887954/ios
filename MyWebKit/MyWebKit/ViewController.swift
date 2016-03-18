//
//  ViewController.swift
//  MyWebKit
//
//  Created by Justinus Andjarwirawan on 3/16/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    let firstURL = "http://www.petra.ac.id"
    let secondURL = "http://mail.petra.ac.id"
    let thirdURL = "http://sim.petra.ac.id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        // create instance
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        
        webView.navigationDelegate = self
        
        view.addSubview(webView)

        webViewLoadURL(firstURL)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func webViewLoadURL(urlString: String) {
        if let url = NSURL(string: urlString) {
            let urlRequest = NSURLRequest(URL: url)
            webView.loadRequest(urlRequest)
        }
    }

    @IBAction func webChanged(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        switch selectedIndex {
        case 0: webViewLoadURL(firstURL)
        case 1: webViewLoadURL(secondURL)
        case 2: webViewLoadURL(thirdURL)
        default: break
        }
    }
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

}

