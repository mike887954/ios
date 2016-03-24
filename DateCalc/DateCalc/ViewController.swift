//
//  ViewController.swift
//  DateCalc
//
//  Created by Justinus Andjarwirawan on 3/24/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dateInterval: NSTimeInterval?
    @IBOutlet weak var fromDate: UIDatePicker!
    @IBOutlet weak var toDate: UIDatePicker!
    @IBAction func hitungButton(sender: UIButton) {

        dateInterval = toDate.date.timeIntervalSinceDate(fromDate.date)
//        print(lroundf(Float(dateInterval!) / 24 / (60 * 60)))
        performSegueWithIdentifier("hitungDate", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "hitungDate") {
            let destination = segue.destinationViewController as! SecondViewController
            destination.teks = String(lroundf(Float(dateInterval!) / 24 / (60 * 60)))
        }
    }


}

