//
//  SecondViewController.swift
//  DateCalc
//
//  Created by Justinus Andjarwirawan on 3/24/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var teks: String?
    
    @IBOutlet weak var teksHasil: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teksHasil.text = teks

    }
}
