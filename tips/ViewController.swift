//
//  ViewController.swift
//  tips
//
//  Created by Lam Hieu on 1/27/16.
//  Copyright © 2016 Lam Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var onePersonLabel: UILabel!
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePersonLabel: UILabel!
    @IBOutlet weak var fourPersonLabel: UILabel!
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var billTemp:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Optionally initialize the property to a desired starting value
        self.firstView.alpha = 1
        self.secondView.alpha = 0
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        billTemp = billField.text!
        //Calculator Bill
        calculator()
        //Save values to defaults
        defaults.setObject(tipControl.selectedSegmentIndex, forKey: "SelectedSegment")
        defaults.setObject(billTemp, forKey: "Bill")
        defaults.setObject(tipLabel.text, forKey: "Tip")
        defaults.setObject(totalLabel.text, forKey: "Total")
        defaults.synchronize()
        
        showHide(billField.text!)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //Load selected segment index = selected segment index in SettingViewController
        tipControl.selectedSegmentIndex=defaults.integerForKey("SettingsSSegment")
        billField.text = defaults.objectForKey("Bill") as? String
        //Calculator Bill
        calculator()
        
        showHide(billField.text!)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //Save defaults = selected segment index from ViewController to SettingViewController
        defaults.setObject(tipControl.selectedSegmentIndex, forKey: "SelectedSegment")
        defaults.synchronize()
    }
    
    // This function to show or hide second view
    func showHide(string: String){
        if(string==""){
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.firstView.alpha = 1
                self.secondView.alpha = 0
            })
        }else{
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.firstView.alpha = 1
                self.secondView.alpha = 1
                
            })
            
        }
    }
    
    // This function use to calculator bill
    func calculator(){
        var tipPercentanges = [0.18,0.20,0.22]
        let tipPercentange = tipPercentanges[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string:billField.text!).doubleValue
        let tip = billAmount * tipPercentange
        let total = billAmount + tip
        let twoPersonBill = total/2
        let threePersonBill = total/3
        let fourPersonBill = total/4
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        twoPersonLabel.text = String(format: "$%.2f",twoPersonBill)
        threePersonLabel.text = String(format: "$%.2f",threePersonBill)
        fourPersonLabel.text = String(format: "$%.2f",fourPersonBill)
        onePersonLabel.text = String(format: "$%.2f",total)
    }
}

