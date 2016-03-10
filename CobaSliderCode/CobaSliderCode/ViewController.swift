//
//  ViewController.swift
//  CobaSliderCode
//
//  Created by Justinus Andjarwirawan on 3/10/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sliderKu: UISlider!
    var mySwitch: UISwitch!
    var mySegment: UISegmentedControl!
    let myItems = [ "Google", "Facebook", "Apple" ]
    var alertKu: UIAlertController?
    var myActionController: UIAlertController!
    
    @IBAction func showAction(sender: AnyObject) {
        self.presentViewController(myActionController, animated: true, completion: nil)
    }
    
    @IBAction func panggilAlert(sender: AnyObject) {
        self.presentViewController(alertKu!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActionController = UIAlertController(title: "Send me via?", message: "You can send me via email", preferredStyle: .ActionSheet)
        
        let emailAction = UIAlertAction(title: "Email", style: .Default) {
            (action) -> Void in
            // do something, like send email
            print("send email")
        }
        
        let messageAction = UIAlertAction(title: "Message", style: .Default) {
            (action) -> Void in
            // do something, like send message
            print("send message")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {
            (action) -> Void in						// coba: .Destructive
            // do something
            print("cancel")
        }
        
        myActionController.addAction(emailAction)
        myActionController.addAction(messageAction)
        myActionController.addAction(cancelAction)
        
        
        sliderKu = UISlider(frame: CGRectMake(view.frame.width/2-120, view.frame.height/2-40, 240, 80))
//        sliderKu.center = view.center
        sliderKu.minimumValue = 0
        sliderKu.maximumValue = 100
        sliderKu.value = 50
        
        view.addSubview(sliderKu)
        
        sliderKu.minimumTrackTintColor = UIColor.blueColor()
        sliderKu.maximumTrackTintColor = UIColor.redColor()
        
        sliderKu.continuous = false
        
        sliderKu.addTarget(self, action: "aksiSlider:", forControlEvents: UIControlEvents.ValueChanged)
        
        mySwitch = UISwitch(frame: CGRect(x: 150, y: 200, width: 0, height:0))
        view.addSubview(mySwitch)
        mySwitch.setOn(true, animated: true)
        
        mySwitch.addTarget(self, action: "mySwitchBerubah:", forControlEvents:
            UIControlEvents.ValueChanged)
        
        mySwitch.tintColor = UIColor.blackColor()
        mySwitch.onTintColor = UIColor.redColor()
        
        mySegment = UISegmentedControl(items: myItems)
        mySegment.center = CGPointMake(view.center.x, view.center.y + 200)
        view.addSubview(mySegment)
        
        mySegment.addTarget(self, action: "mySegmentBerubah:", forControlEvents: .ValueChanged)
        mySegment.selectedSegmentIndex = 1 // default
        
        alertKu = UIAlertController(title: "Alert Ku", message: "Hello how are you?", preferredStyle: .Alert)
        let aksiAlert = UIAlertAction(title: "Batal", style: .Default) {
            (action) -> Void in
            print("Selesai, button ditekan")
        }
        alertKu?.addAction(aksiAlert)
        
        alertKu?.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.placeholder = "Masukkan nama"
        })	// tambahkan lagi bila perlu text field lagi
        alertKu?.addTextFieldWithConfigurationHandler({ (textField) -> Void in textField.placeholder = "Password" })
            
        let teksAlert = UIAlertAction(title: "Log In", style: .Default) { (action) -> Void in
            if let textFields = self.alertKu?.textFields {
                let theTextFields = textFields
                let usernameText = theTextFields[0].text
                print("Your username is \(usernameText!)")
                let myPass = theTextFields[1].text
                print("Your password is \(myPass!)")
            }
        }
        alertKu?.addAction(teksAlert)
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        self.presentViewController(alertKu!, animated: true, completion: nil)
//    }
    
    func aksiSlider(sender: UISlider) {
        print("\(Int(sender.value))")
    }
    
    func mySwitchBerubah(sender: UISwitch) {
        if mySwitch.on {
            print("ON")
        } else {
            print("OFF")
        }
    }
    
    func mySegmentBerubah(sender: UISegmentedControl) {
        let pilihanIndex = sender.selectedSegmentIndex
        print(pilihanIndex)	// mencetak nomor index terpilih
        if let indexTerpilih = sender.titleForSegmentAtIndex(pilihanIndex) {
            print(indexTerpilih)	// mencetak title segment terpilih
        }
    }

}

