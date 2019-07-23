//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let operand = sender.titleLabel?.text {
            if let brain = brain {
                outputLabel.text = brain.addOperandDigit(operand)
            }
        }
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let selectedOperator = sender.titleLabel?.text {
            if let brain = brain {
                brain.setOperator(selectedOperator)
            }
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let total = brain?.calculateIfPossible() {
            outputLabel.text = total
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        brain = nil
        brain = CalculatorBrain()
    }
}
