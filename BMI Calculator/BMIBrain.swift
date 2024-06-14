//
//  BMIBrain.swift
//  BMI Calculator
//
//  Created by Mehmet Emrah Konya on 14.06.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

protocol BMIBrainDelegate{
    func callResultScreen(_ bmiValue:String, _ textMessage:String, _ bgColor:UIColor)
}



class BMIBrain{
    var bmiValue: Float?
    var delegate:BMIBrainDelegate?
    var textMessage:String?
    var bgColor:UIColor?
    var bmiString:String?
    
    func calculateBMI(_ height:Float, _ weight:Float){
        bmiValue = weight/(height*height)
        if let bmiV = bmiValue{
            print("Here is the BMI \(String(format: "%.0f", bmiV))")
            prepareTheData(bmiV)
        }
    }
    
    func prepareTheData(_ bmiVal:Float){
        if bmiVal <= 18.5 {
            textMessage = "You are fit"
            bgColor = UIColor.green
        } else if bmiVal <= 29 {
            textMessage = "You are fat"
            bgColor = UIColor.blue
        } else if bmiVal >= 30 {
            textMessage = "You are an elephent"
            bgColor = UIColor.red
        }
        
        bmiString = String(format: "%.1f", bmiVal)
        delegate?.callResultScreen(bmiString!, textMessage!, bgColor!)
    }
}
