//
//  ViewController.swift
//  TipCalculator
//
//  Created by Terrence Ohr on 8/10/17.
//  Copyright © 2017 Terrence Ohr. All rights reserved.
//
//  Build 2

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkAmountText: UITextField!
    @IBOutlet weak var tipPercentText: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var tipAmountText: UILabel!
    @IBOutlet weak var checkTotalText: UILabel!
    @IBOutlet weak var warningMessage: UILabel!
    
    var checkAmountNum: Double = 0.00
    var tipPercentNum: Double = 20
    var tipAmountNum: Double = 0.00
    var checkTotalNum: Double = 0.00
        
    @IBAction func GoButtonPressed(_ sender: Any) {             // User presses GO
        if checkAmountText.text == "" {
        warningMessage.isHidden = false
        }
        else  {
            warningMessage.isHidden = true
            checkAmountNum = Double(checkAmountText.text!)!
            calculateStuff (checkAmountNum, tipPercentNum)
        }
    }

    @IBAction func StepperPressed(_ sender: UIStepper) {        // User presses the Tip Stepper
        if checkAmountText.text == "" {
            warningMessage.isHidden = false
        }
        else  {
            warningMessage.isHidden = true
            checkAmountNum = Double(checkAmountText.text!)!
        let tipPercentNum = Double(sender.value)
        calculateStuff (checkAmountNum, tipPercentNum)
        }
    }
    
    func calculateStuff (_ amount: Double, _ percent: Double)  {              // Calculates and displays values
        let checkTotalNum = amount + amount * percent / 100
        tipPercentNum = percent
        tipPercentText.text = "Gratuity = \(String(format: "%.0f%", tipPercentNum))%"
        tipAmountText.text = "Tip Amount = \(String(format: "$%.2f", (checkAmountNum * tipPercentNum / 100)))"
        checkTotalText.text = "Total Amount = \(String(format: "$%.2f", (checkTotalNum)))"
        textFieldShouldReturn(checkAmountText)
        return
     }
    
    func textFieldShouldReturn(_ textField: UITextField)  {                 // Puts away the keypad
        self.view.endEditing(true)
        return 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.wraps = true                                                         // Initializes the stepper values
        stepper.autorepeat = true
        stepper.maximumValue = 100
        stepper.value = 20

        checkAmountText.becomeFirstResponder()
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

