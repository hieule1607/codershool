//
//  SettingsViewController.swift
//  tips
//
//  Created by Lam Hieu on 1/27/16.
//  Copyright © 2016 Lam Hieu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingTipControll: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Load selected segment index = selected segment index in ViewController
        settingTipControll.selectedSegmentIndex=defaults.integerForKey("SelectedSegment")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(animated: Bool) {
       //Save defaults = selected segment index from SettingViewController to ViewController
        defaults.setObject(settingTipControll.selectedSegmentIndex, forKey: "SettingsSSegment")
        defaults.synchronize()
        
    }

    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
    }
*/

}
