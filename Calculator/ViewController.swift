//
//  ViewController.swift
//  Calculator
//
//  Created by Pavel Shymanski on 2.04.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private  var isFinishedTypingNumber = true
    private var isNumberDouble: Double {
        get{
            guard  let number = Double(displayLabel.text!)else{
                fatalError("Cannot convert this value to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    var calculator  = CalculatorLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        if let method  = sender.currentTitle {
            calculator.setNumber(number: isNumberDouble)
            if let result = calculator.calculate(calcMethod: method){
                isNumberDouble = result
            }
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let number = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = number
                isFinishedTypingNumber = false
            } else {
                if  number == "." {
                    let isInt = floor(Double(isNumberDouble)) == isNumberDouble
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + number
            }
        }
    }
}
