//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BMIBrainDelegate {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    var heightValue:Float = 1.5
    var weightValue:Float = 100
    
    var bL: String?
    var tL: String?
    var bC: UIColor?
    
    var bmiBrain = BMIBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bmiBrain.delegate = self
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        heightValue = sender.value
        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightValue = sender.value
        weightLabel.text = "\(String(format: "%.0f", sender.value))Kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        bmiBrain.calculateBMI(heightValue, weightValue)
    }
    
    func callResultScreen(_ bmiValue:String, _ textMessage:String, _ bgColor:UIColor){
        bL = bmiValue
        tL = textMessage
        bC = bgColor
        
        performSegue(withIdentifier: "nextScreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "nextScreen"){
            let destinationVC = segue.destination as? ResultViewController
            destinationVC?.bgColor = bC
            destinationVC?.bmiLabel = bL
            destinationVC?.textLabel = tL
        }
    }
   
}

