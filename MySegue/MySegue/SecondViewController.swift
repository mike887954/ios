//
//  SecondViewController.swift
//  MySegue
//
//  Created by Justinus Andjarwirawan on 3/17/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

protocol DelegasiSebrang {
    func gantiTeks(isi: String)
}

class SecondViewController: UIViewController {
    
    var delegate: DelegasiSebrang! = nil
    var teks: String! = nil
    
    @IBOutlet weak var inputSecond: UITextField!
    
    @IBAction func buttonSecond(sender: UIButton) {
        delegate.gantiTeks(inputSecond.text!)
        self.navigationController?.popToRootViewControllerAnimated(true)

    }
    
    @IBOutlet weak var labelSecond: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        labelSecond.text = teks
    }

}
