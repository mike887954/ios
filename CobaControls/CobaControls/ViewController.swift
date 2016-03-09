//
//  ViewController.swift
//  CobaControls
//
//  Created by Justinus Andjarwirawan on 3/3/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mySwitch: UISwitch!
    var mySegment: UISegmentedControl!
    var myItems = [ "Google", "Apple", "Facebook"]
    
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
        
        mySwitch = UISwitch(frame: CGRect(x: view.frame.width/2-24, y: view.frame.height/2, width: 0, height:0))    // atau view.center.x, view.center.y
        view.addSubview(mySwitch)
        mySwitch.setOn(true, animated: true)
        mySwitch.tintColor = UIColor.blackColor()
        mySwitch.onTintColor = UIColor.redColor()
        
        mySegment = UISegmentedControl(items: myItems)
        mySegment.center = CGPointMake(view.center.x, view.center.y + 133)
        view.addSubview(mySegment)
        mySegment.addTarget(self, action: "mySegmentBerubah:", forControlEvents: .ValueChanged)

    }
    
    func mySegmentBerubah(sender: UISegmentedControl) {
        let pilihanIndex = sender.selectedSegmentIndex
        print(pilihanIndex)
        if let indexTerpilih = sender.titleForSegmentAtIndex(pilihanIndex) {
            print(indexTerpilih)
        }
    }

}

