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

    var tipPercentages = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercentages[0], forKey: "tipPercentage1")
        defaults.setObject(tipPercentages[1], forKey: "tipPercentage2")
        defaults.setObject(tipPercentages[2], forKey: "tipPercentage3")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
//        println("User editing bill")
        
//        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
//        println(tipPercentage)
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var doubleValue = defaults.doubleForKey("tipPercentage1")
        println(doubleValue)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

