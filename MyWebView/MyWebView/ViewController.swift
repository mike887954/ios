//
//  ViewController.swift
//  MyWebView
//
//  Created by Justinus Andjarwirawan on 3/16/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    
    func displayURL() {
        let myURLString = "http://www.petra.ac.id"
        let myURL = NSURL(string: myURLString)
        let myURLRequest = NSURLRequest(URL: myURL!)
        
        myWebView.loadRequest(myURLRequest)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        displayURL()
    }

}

