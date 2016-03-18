//
//  ViewController.swift
//  MySegue
//
//  Created by Justinus Andjarwirawan on 3/17/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DelegasiSebrang {

    
    @IBOutlet weak var inputFirst: UITextField!
    
    @IBAction func buttonFirst(sender: UIButton) {
        performSegueWithIdentifier("mySegueToSecondView", sender: self)
    }
    
    @IBOutlet weak var labelFirst: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "mySegueToSecondView") {
            let destination = segue.destinationViewController as! SecondViewController
            destination.delegate = self // "delegate" di SecondViewController
            destination.teks = inputFirst.text
        }
    }

    func gantiTeks(isi: String) {
        labelFirst.text = isi
    }

}

