//
//  ViewController.swift
//  PetraDirectory
//
//  Created by Justinus Andjarwirawan on 10/1/15.
//  Copyright © 2015 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userName:[String] = []
    var realName:[String] = []
    var otherInfo: [String] = []

    @IBOutlet weak var waiting: UIActivityIndicatorView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var selectSegment: UISegmentedControl!
    @IBAction func searchButton(sender: AnyObject) {
        //need to check searchField for funny characters that cause freeze
        var teks = String(searchField.text)
        let customAllowedSet =  NSCharacterSet(charactersInString:" +.=\"#%/<>?@\\^`{|}&!`~*").invertedSet
        teks = (searchField.text?.stringByAddingPercentEncodingWithAllowedCharacters(customAllowedSet))!
        print(teks)
//        if let a = searchField.text {
//            print(a)
//            if String(UTF8String: a) == nil {
//                alertMe()
//            }
//        }
        self.waiting.hidden = false
        self.waiting.startAnimating()
        DismissKeyboard()
        var myURL: NSURL
        if selectSegment.selectedSegmentIndex == 0 {
            myURL = NSURL(string: "http://peter.petra.ac.id/~justin/finger.php?s=\(teks)")!
        } else {
            myURL = NSURL(string: "http://john.petra.ac.id/~justin/finger.php?s=\(teks)")!
        }
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(myURL, completionHandler: {
            (location: NSURL?, response: NSURLResponse?, error: NSError?) -> Void in
                let dataObject = NSData(contentsOfURL: location!)
                var myDictionary: NSDictionary!
                do {
                    myDictionary = try NSJSONSerialization.JSONObjectWithData(dataObject!, options: []) as! NSDictionary
                } catch {
                    print("ada error Dictionary")
                    myDictionary = ["hasil":""] //kosongkan biar tdk error
                }
                //print(myDictionary)
                let currentDictionary = myDictionary as NSDictionary
                dispatch_async(dispatch_get_main_queue(), {
                    //key value of root JSON (key is "hasil", ignored)
                    for (_,isian) in currentDictionary {
                        //check if isian is empty!
                        if let _ = isian as? NSMutableArray {
                            //print("ok")
                        } else {
                            //print("not ok")
                            self.waiting.stopAnimating()
                            self.waiting.hidden = true
                            self.alertMe()
                            break
                        } //end of check
                        self.userName = []
                        self.realName = []
                        self.otherInfo = []
                        for value in isian as! NSMutableArray {
                            let a = value["login"] as! String
                            let b = value["nama"] as! String
                            let c = value["unit"] as! String
                            self.userName += ["\(a)"]
                            self.realName += ["\(b)"]
                            self.otherInfo += ["\(c)"]
                        }
                        self.waiting.stopAnimating()
                        self.waiting.hidden = true
                        self.performSegueWithIdentifier("toTableView", sender: self)
                    }
                }) //end of dispatch
        }) //end of (location: NSURL
        downloadTask.resume()
    } //end of func searchButton
    override func viewDidLoad() {
        super.viewDidLoad()
        self.waiting.hidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func DismissKeyboard() {
        view.endEditing(true)
    }
    
    func alertMe() {
        let alertKu = UIAlertController(title: "Not Found", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alertKu.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alertKu, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let thisView = segue.destinationViewController as? TableViewController {
            if segue.identifier == "toTableView" {
                for isi in 0..<userName.count {
                    thisView.userName += ["\(userName[isi])"]
                    thisView.realName += ["\(realName[isi])"]
                    thisView.otherInfo += ["\(otherInfo[isi])"]
                }
            }
        }
    }
}

