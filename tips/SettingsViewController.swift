//
//  SettingsViewController.swift
//  tips
//
//  Created by Keita on 1/12/15.
//  Copyright (c) 2015 Keita Ito. All rights reserved.
//

import UIKit



class SettingsViewController: UIViewController {

// MARK: outlets and variables
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var segmentField1: UITextField!
    @IBOutlet weak var segmentField2: UITextField!
    @IBOutlet weak var segmentField3: UITextField!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    var color: UIColor!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("view did load")
        
        // get values from NSUserDefaults
        var doubleValue1 = defaults.doubleForKey("tipPercentage1")
        var doubleValue2 = defaults.doubleForKey("tipPercentage2")
        var doubleValue3 = defaults.doubleForKey("tipPercentage3")
        println(doubleValue1)
        println(doubleValue2)
        println(doubleValue3)
        
        // update segment value field
        segmentField1.text = String(format: "%.2f", doubleValue1)
        segmentField2.text = String(format: "%.2f", doubleValue2)
        segmentField3.text = String(format: "%.2f", doubleValue3)
        
        var redValue = redColorSlider.value
        var greenValue = greenColorSlider.value
        var blueValue = blueColorSlider.value
        
        println(redValue)
        println(greenValue)
        println(blueValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
// MARK: segment config methods
    
    @IBAction func onEditingChangedSegment1(sender: AnyObject) {
        // convert number as text to double
        var valueSegment1 = segmentField1.text._bridgeToObjectiveC().doubleValue
        println(valueSegment1)
        // put it into NSUserDefaults
        defaults.setDouble(valueSegment1, forKey: "tipPercentage1")
    }
    
    @IBAction func onEditingChangedSegment2(sender: AnyObject) {
        var valueSegment2 = segmentField2.text._bridgeToObjectiveC().doubleValue
        println(valueSegment2)
        defaults.setDouble(valueSegment2, forKey: "tipPercentage2")
    }
    
    @IBAction func onEditingChangedSegment3(sender: AnyObject) {
        var valueSegment3 = segmentField3.text._bridgeToObjectiveC().doubleValue
        println(valueSegment3)
        defaults.setDouble(valueSegment3, forKey: "tipPercentage3")
    }

// MARK: other actions
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    // close settingView when done button is touched
    @IBAction func dismissWindow(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
// MARK: view actions
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
}
