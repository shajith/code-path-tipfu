//
//  ViewController.swift
//  tipfu
//
//  Created by Shajith on 2/1/15.
//  Copyright (c) 2015 zd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipPercentageIndex = defaults.integerForKey("defaultTipPercentageIndex")
        
        tipPercentSegment.selectedSegmentIndex = tipPercentageIndex;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentages[tipPercentSegment.selectedSegmentIndex]
        
        var total = billAmount + tip
        var formatter = NSNumberFormatter()
        
        formatter.numberStyle = .CurrencyStyle
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
}

