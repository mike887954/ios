//
//  ViewController.swift
//  MyControlsFixed
//
//  Created by Justinus Andjarwirawan on 3/16/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sliderText: UILabel!
    @IBOutlet weak var switchText: UILabel!
    @IBOutlet weak var segmentText: UILabel!
    
    @IBAction func sliderAction(sender: UISlider) {
        sliderText.text = Int(sender.value).description
    }
    
    @IBAction func switchAction(sender: UISwitch) {
        if sender.on {
            switchText.text = "ON"
        } else {
            switchText.text = "OFF"
        }
    }
    
    @IBAction func segmentAction(sender: UISegmentedControl) {
        segmentText.text = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}

