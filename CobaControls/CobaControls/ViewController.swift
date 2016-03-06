//
//  ViewController.swift
//  CobaControls
//
//  Created by Justinus Andjarwirawan on 3/3/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slide1: UISlider!

    @IBOutlet weak var namaSegment: UILabel!
    @IBOutlet weak var indexSegment: UILabel!
    @IBAction func actionSegment(sender: AnyObject) {
        indexSegment.text = outletSegment.selectedSegmentIndex.description
        namaSegment.text = outletSegment.titleForSegmentAtIndex(outletSegment.selectedSegmentIndex)
    }
    @IBOutlet weak var outletSegment: UISegmentedControl!
    @IBOutlet weak var statusSwitch: UILabel!
    @IBOutlet weak var outletSwitch: UISwitch!
    @IBAction func actionSwitch(sender: AnyObject) {
        if outletSwitch.on {
            statusSwitch.text="On"
        } else {
            statusSwitch.text="Off"
        }
    }
    @IBOutlet weak var totalBayar: UILabel!
    @IBOutlet weak var theNumber: UILabel!
    @IBAction func slide2(sender: AnyObject) {
//        print(lroundf(slide1.value))
        theNumber.text = Int(slide1.value).description
//        totalBayar.text = hitung(Double(slide1.value)).description
        totalBayar.text = String.localizedStringWithFormat("%.2f",hitung(Double(slide1.value)))
    }
    
    func hitung(yourVal: Double) -> Double {
        return Double(yourVal + yourVal * 0.015)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        totalBayar.text = hitung(Double(slide1.value)).description
        totalBayar.text = String.localizedStringWithFormat("%.2f",hitung(Double(slide1.value)))
    }


}

