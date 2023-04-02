//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Pavel Shymanski on 2.04.23.
//

import Foundation

struct CalculatorLogic {
    
    private var numberDouble: Double?
    private var intermidiateCalculation:(number: Double, method:String)?
    
    mutating func setNumber(number: Double){
        numberDouble = number
    }
    
    
    func performTwoNumCalculation (n2: Double) -> Double? {
        if let n1 = intermidiateCalculation?.number,
           let operation = intermidiateCalculation?.method {
            switch operation {
            case "+" :
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
            
        }
        return nil
    }
    
    
    
   mutating func calculate(calcMethod: String) -> Double? {
        
        if let n  = numberDouble {
            switch calcMethod {
            case "%":
                return n * 0.01
            case "+/-":
                return n * -1
            case "AC":
                return n * 0
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermidiateCalculation = (number:n, method:calcMethod)
            }
            
        }
        return nil
    }
    
}
