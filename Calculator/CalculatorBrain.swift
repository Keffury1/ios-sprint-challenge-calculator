//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String += digit
            return operand1String
        } else {
            operand2String += digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        if operand1String.isEmpty == false, operand2String.isEmpty == false {
           guard let operatorType = operatorType else { return "Needs an operator"}
            guard let operand1Digit = Double(operand1String), let operand2Digit = Double(operand2String) else { return "Needs a digit." }
            switch operatorType {
            case .addition:
                return String(operand1Digit + operand2Digit)
            case .subtraction:
                return String(operand1Digit - operand2Digit)
            case .multiplication:
                return String(operand1Digit * operand2Digit)
            case .division:
                if operand2Digit != 0 {
                return String(operand1Digit / operand2Digit)
                } else {
                    return "Error"
                }
            }
        }
        return "Error"
    }
}
