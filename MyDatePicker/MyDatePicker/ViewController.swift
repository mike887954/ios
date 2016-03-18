//
//  ViewController.swift
//  MyDatePicker
//
//  Created by Justinus Andjarwirawan on 3/16/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create an instance of date picker, center it and add to view
        datePicker = UIDatePicker()
        datePicker.center = view.center
        view.addSubview(datePicker)
        
        // add an action
        datePicker.addTarget(self, action: "datePickerChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }

    func datePickerChanged(sender: UIDatePicker) {
        print("tanggal yang dipilih: \(datePicker.date)")
    }

    @IBAction func gantiMinMax(sender: AnyObject) {
        datePicker.datePickerMode = UIDatePickerMode.Date
        let oneYear: NSTimeInterval = 365 * 24 * 60 * 60
        let today = NSDate()
        let oneYearFromToday = today.dateByAddingTimeInterval(oneYear)
        let twoYearsFromToday = today.dateByAddingTimeInterval(oneYear * 2)
        
        // set min max
        datePicker.minimumDate = oneYearFromToday
        datePicker.maximumDate = twoYearsFromToday
    }
    
    @IBAction func keDefault(sender: AnyObject) {
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
    }
    
    @IBAction func countDown(sender: AnyObject) {
        datePicker.datePickerMode = UIDatePickerMode.CountDownTimer
        
        let threeMinutes = (3 * 60) as NSTimeInterval
        datePicker.countDownDuration = threeMinutes
    }
    
}

