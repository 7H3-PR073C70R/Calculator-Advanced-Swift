//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by protector on 1/15/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermediateCalculation : (n1: Double, operation : String)?
    
    mutating func setNumber(_ number : Double){
        self.number = number
    }
    
    
    mutating func calculate(operationSymbol : String) -> Double? {
        if let n = number {
            switch operationSymbol {
            case "AC":
                number = nil
                intermediateCalculation = nil
                return 0
            case "%":
                return n * 0.01
            case "+/-":
                return n * -1
            case "=":
                return performCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, operation: operationSymbol)
                
            }
        }
        
        return nil
    }
    
    private func performCalculation(n2 : Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let calcOperation = intermediateCalculation?.operation {
            print("Called")
            switch calcOperation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Something has terribly gone wrong")
            }
        }
        return nil
    }
    
}
