//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Angela Yu on 28/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / ( height * height)
        switch bmiValue {
        case 0...18.5: bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .systemBlue)
        case 18.5...24.9: bmi = BMI(value: bmiValue, advice: "Fit as a Fiddle!", color: .systemGreen)
        default: bmi = BMI(value: bmiValue, advice: "Eat less pies", color: .red)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
}
