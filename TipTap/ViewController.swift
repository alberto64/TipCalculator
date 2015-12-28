//
//  ViewController.swift
//  TipTap
//
//  Created by Karla on 12/14/15.
//  Copyright © 2015 Alberto J. De Jesus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CalcText: UITextField!
    @IBOutlet weak var billTotal: UILabel!
    @IBOutlet weak var tipTotal: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billTotal.text = "$0.00"
        tipTotal.text = "$0.00"
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercents = [0.15, 0.2, 0.25]
        let tipPercent = tipPercents[tipControl.selectedSegmentIndex]
        let billValue = NSString(string: CalcText.text!).doubleValue
        let tip = billValue * tipPercent
        let total = tip + billValue
    
        tipTotal.text = String(format: "$%.2f", tip)
        billTotal.text = String(format: "$%.2f", total)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        // Pass the selected object to the new view controller
    }

    @IBAction func onPush(sender: AnyObject) {
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("SegmentInfo")
        let tipPercents = [0.15, 0.2, 0.25]
        let tipPercent = tipPercents[tipControl.selectedSegmentIndex]
        let billValue = NSString(string: CalcText.text!).doubleValue
        let tip = billValue * tipPercent
        let total = tip + billValue
        
        tipTotal.text = String(format: "$%.2f", tip)
        billTotal.text = String(format: "$%.2f", total)
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
}

