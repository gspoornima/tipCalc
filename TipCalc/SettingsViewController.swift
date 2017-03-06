//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Poornima on 3/5/17.
//  Copyright © 2017 Poornima. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "default_tip_index")
        defaultTipControl.selectedSegmentIndex = defaultTipIndex
    }
    
    
    @IBAction func onTipValueChanged(_ sender: Any) {
        let selectedIndex = defaultTipControl.selectedSegmentIndex
        let defaults = UserDefaults.standard
        defaults.set(selectedIndex, forKey: "default_tip_index")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
