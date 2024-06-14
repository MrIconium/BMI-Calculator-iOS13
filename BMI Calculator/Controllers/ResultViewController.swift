//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Mehmet Emrah Konya on 14.06.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController{
    var textLabel:String?
    var bmiLabel:String?
    var bgColor:UIColor?
    
    @IBOutlet weak var bL: UILabel!
    @IBOutlet weak var tL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bL.text = bmiLabel
        tL.text = textLabel
        self.view.backgroundColor = bgColor
    }
    
    @IBAction func recalculateBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
