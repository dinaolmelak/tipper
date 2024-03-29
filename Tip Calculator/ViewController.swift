//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Center for Innovation on 11/13/19.
//  Copyright © 2019 Center for Innovation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coin: UIImageView!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.double(forKey: "lastBill") != 0.0{
            billAmountTextField.text = String(UserDefaults.standard.double(forKey: "lastBill"))
            calculateTip(self)
        }
    }

    @IBAction func didTapView(_ sender: Any) {
        print ("Dinaol is the best")
        view.endEditing(true)
        
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        UserDefaults.standard.set(bill, forKey: "lastBill")
        //get bill amount
        let tipPercentages = [0.1,0.18,0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        //calculate tip and total
        
        //update the tip and total label
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
//    func dropCoin(tips numberTip: Int){
//        let coinLocation = coin.frame.origin
//        
//        
//        
//        
//    }
    
}

