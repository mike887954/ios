//
//  ViewController.swift
//  MyPickerView
//
//  Created by Justinus Andjarwirawan on 3/10/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var pickerView: UIPickerView!
    var currentData = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    @IBAction func pilih(sender: AnyObject) {
        let selectedRow = pickerView.selectedRowInComponent(0)
        print(currentData[selectedRow])
    }
    
    var newData = [ 12, 13, 14, 15, 16, 17, 18, 19, 20 ]
    @IBAction func gantiData(sender: AnyObject) {
        currentData = newData
        pickerView.reloadComponent(0) // penting!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView = UIPickerView()
        pickerView.center = view.center
        view.addSubview(pickerView)
        pickerView.dataSource = self    // add: UIPickerViewDataSource
        pickerView.delegate = self  // add: UIPickerViewDelegate
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView == self.pickerView {
            return 1
        }
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.pickerView {
            return currentData.count
        }
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?     {
        return("\(currentData[row])")
    }

}

