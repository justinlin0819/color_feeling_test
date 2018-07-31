//
//  ViewController.swift
//  color_feeling_test
//
//  Created by Justin Lin on 2018/7/31.
//  Copyright © 2018年 Justin Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider_ColorChange: [UISlider]!
    @IBOutlet var stepper_ColorChange: [UIStepper]!
    
    @IBOutlet var label_RGBValue: [UILabel]!
    
    
    @IBOutlet weak var label_Question: UILabel!
    @IBOutlet weak var label_Answer: UILabel!
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    @IBAction func slider_ColorChange(_ sender: UISlider) {
        red = CGFloat(Int(slider_ColorChange[0].value))/255
        green = CGFloat(Int(slider_ColorChange[1].value))/255
        blue = CGFloat(Int(slider_ColorChange[2].value))/255
        
        label_RGBValue[0].text = String(Int(slider_ColorChange[0].value))
        label_RGBValue[1].text = String(Int(slider_ColorChange[1].value))
        label_RGBValue[2].text = String(Int(slider_ColorChange[2].value))
        
        stepper_ColorChange[0].value = Double(Int(slider_ColorChange[0].value))
        stepper_ColorChange[1].value = Double(Int(slider_ColorChange[1].value))
        stepper_ColorChange[2].value = Double(Int(slider_ColorChange[2].value))
        
        label_Answer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    @IBAction func stepper_ColorChange(_ sender: UIStepper) {
        red = CGFloat(Int(stepper_ColorChange[0].value))/255
        green = CGFloat(Int(stepper_ColorChange[1].value))/255
        blue = CGFloat(Int(stepper_ColorChange[2].value))/255
        
        label_RGBValue[0].text = String(Int(stepper_ColorChange[0].value))
        label_RGBValue[1].text = String(Int(stepper_ColorChange[1].value))
        label_RGBValue[2].text = String(Int(stepper_ColorChange[2].value))
        
        slider_ColorChange[0].value = Float(Int(stepper_ColorChange[0].value))
        slider_ColorChange[1].value = Float(Int(stepper_ColorChange[1].value))
        slider_ColorChange[2].value = Float(Int(stepper_ColorChange[2].value))
        
        label_Answer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
