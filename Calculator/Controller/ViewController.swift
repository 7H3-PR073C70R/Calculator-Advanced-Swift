//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var oldValue : Double = 0.0
    private var operation : String = ""
    private var isDoneTyping : Bool = false
    
    private var displayValue : Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    private var calculator = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isDoneTyping = true
        calculator.setNumber(displayValue)
        //What should happen when a non-number button is pressed
        
        
        if let result =  calculator.calculate(operationSymbol: sender.currentTitle!)  {
            displayValue = result
        }
        
        
        
        
    }
    
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isDoneTyping {
                isDoneTyping = false
                displayLabel.text = numValue
            }
            else {
                if (displayLabel.text == "0" && numValue != ".") {
                    displayLabel.text = numValue
                } else {
                    if numValue == "." {
                        let isInt = floor(Double(displayLabel.text!)!) == Double(displayLabel.text!)
                        
                        if !isInt {
                            return
                        }
                    }
                    displayLabel.text?.append(numValue)
                }
            }
            
        }
        
    }
    
}

