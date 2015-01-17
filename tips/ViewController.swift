//
//  ViewController.swift
//  tips
//
//  Created by Keita on 1/11/15.
//  Copyright (c) 2015 Keita Ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    // create tipPercentages array with initial tip values
    var tipPercentages = [0.18, 0.2, 0.22]
    
    // create NSUserDefaults
    var defaults = NSUserDefaults.standardUserDefaults()
    
    var hasDoneSettings: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize labels
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        hasDoneSettings = defaults.boolForKey("hasDoneSettings")
        
        if !hasDoneSettings {
            // create key-value sets to NSUserDefaults
            defaults.setDouble(tipPercentages[0], forKey: "tipPercentage1")
            defaults.setDouble(tipPercentages[1], forKey: "tipPercentage2")
            defaults.setDouble(tipPercentages[2], forKey: "tipPercentage3")
            defaults.synchronize()

        } else {
            
            // Get values from NSUserDefaults for tipPercentages
            var doubleValue1 = defaults.doubleForKey("tipPercentage1")
            var doubleValue2 = defaults.doubleForKey("tipPercentage2")
            var doubleValue3 = defaults.doubleForKey("tipPercentage3")
            
            // put values to tipPercentages array
            tipPercentages[0] = doubleValue1
            tipPercentages[1] = doubleValue2
            tipPercentages[2] = doubleValue3
            
            // create key-value sets to NSUserDefaults
            defaults.setDouble(tipPercentages[0], forKey: "tipPercentage1")
            defaults.setDouble(tipPercentages[1], forKey: "tipPercentage2")
            defaults.setDouble(tipPercentages[2], forKey: "tipPercentage3")
            defaults.synchronize()
        }
        
        
        
        println("tip root view did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
//        println("User editing bill")
        
        // get one tip value from tipPercentages array to calculate
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
//        println(tipPercentage)

        // calculate tip and total amount
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
//        tipLabel.text = "$\(tip)"
//        totalLabel.text = "$\(total)"
        
        // update label
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
//        var defaults = NSUserDefaults.standardUserDefaults()
//        var doubleValue = defaults.doubleForKey("tipPercentage1")
//        println(doubleValue)
    }

    @IBAction func onTap(sender: AnyObject) {
        // dismiss keyboard
        view.endEditing(true)
    }
    
    // when screen shows again rootView from settingView
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("rootView will appear")
        
        hasDoneSettings = defaults.boolForKey("hasDoneSettings")
        var colorData: NSData!
        
        if !hasDoneSettings {
            return
        } else {
            // get colorData from NSUserDefaults
            colorData = defaults.objectForKey("color") as NSData
            
            // unarchive colorData
            var color = NSKeyedUnarchiver.unarchiveObjectWithData(colorData) as UIColor
            self.view.backgroundColor = color
        }
        
        if  !hasDoneSettings {
            return
        } else {
            // get values from NSUserDefa ults
            var doubleValue1 = defaults.doubleForKey("tipPercentage1")
            var doubleValue2 = defaults.doubleForKey("tipPercentage2")
            var doubleValue3 = defaults.doubleForKey("tipPercentage3")
            
            // put values into tipPercentage array
            tipPercentages[0] = doubleValue1
            tipPercentages[1] = doubleValue2
            tipPercentages[2] = doubleValue3
            
            // convert double values to int
            var intValue1 = Int(doubleValue1 * 100)
            var intValue2 = Int(doubleValue2 * 100)
            var intValue3 = Int(doubleValue3 * 100)
            
            // update tipControlSegment
            tipControl.setTitle("\(intValue1)%" , forSegmentAtIndex: 0)
            tipControl.setTitle("\(intValue2)%" , forSegmentAtIndex: 1)
            tipControl.setTitle("\(intValue3)%" , forSegmentAtIndex: 2)
        }
    }
}

// created a branch dev1
