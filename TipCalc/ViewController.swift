//
//  ViewController.swift
//  TipCalc
//
//  Created by Poornima on 3/4/17.
//  Copyright © 2017 Poornima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtBill: UITextField!
    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let numberFormatter = NumberFormatter()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberFormatter.numberStyle = .currency
        txtBill.becomeFirstResponder()
        
        if let lastBillAmount = getLastBillAmount(){
                txtBill.text = lastBillAmount
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "default_tip_index")
        tipControl.selectedSegmentIndex = defaultTipIndex
        calculateTip(tipControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        saveBillAmount()
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(txtBill.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        lblTip.text = numberFormatter.string(from: NSNumber(floatLiteral: tip))
        lblTotal.text = numberFormatter.string(from: NSNumber(floatLiteral: total))
    }
    
    func saveBillAmount(){
        let billAmount = txtBill.text
        defaults.set(billAmount, forKey: "last_bill_amount")
        defaults.set(NSDate(), forKey: "last_bill_timestamp")
    }
    
    func getLastBillAmount() -> String?{
        let lastBillTimeStamp = defaults.object(forKey: "last_bill_timestamp") as! NSDate?
        if lastBillTimeStamp != nil{
            let diff = NSDate().timeIntervalSince(lastBillTimeStamp as! Date)
            if diff < TimeInterval(600){
                return (defaults.object(forKey: "last_bill_amount") as! String)
            }
        }
        return nil
    }
   
}

