//
//  ViewController.swift
//  color_feeling_test
//
//  Created by Justin Lin on 2018/7/31.
//  Copyright © 2018年 Justin Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination
        vc.preferredContentSize=CGSize(width: 300, height: 50)
        let controller = vc.popoverPresentationController
        if controller != nil {
            controller?.delegate = self
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    @IBOutlet var slider_ColorChange: [UISlider]!
    @IBOutlet var stepper_ColorChange: [UIStepper]!
    
    @IBOutlet var label_RGBValue: [UILabel]!
    
    
    @IBOutlet weak var label_Question: UILabel!
    @IBOutlet weak var label_Answer: UILabel!
    @IBOutlet weak var label_StandardAnswer: UILabel!
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    var question_red: CGFloat = 0
    var question_green: CGFloat = 0
    var question_blue: CGFloat = 0
    
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
        question_red = CGFloat(Int.random(in: 0...255))/255
        question_green = CGFloat(Int.random(in: 0...255))/255
        question_blue = CGFloat(Int.random(in: 0...255))/255
        label_Question.backgroundColor = UIColor(red: question_red, green: question_green, blue: question_blue, alpha: 1)
        
        label_Answer.backgroundColor = UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 1)
        
        label_RGBValue[0].text = "127"
        label_RGBValue[1].text = "127"
        label_RGBValue[2].text = "127"
        
        stepper_ColorChange[0].value = 127
        stepper_ColorChange[1].value = 127
        stepper_ColorChange[2].value = 127
        
        slider_ColorChange[0].value = 127
        slider_ColorChange[1].value = 127
        slider_ColorChange[2].value = 127
        
        label_StandardAnswer.text = nil
    }
    
    @IBAction func button_Submit(_ sender: Any) {
        if question_red == red && question_green == green && question_blue == blue {
            performSegue(withIdentifier: "showpopover_Win", sender: nil)
            }
            else {
            performSegue(withIdentifier: "showpopover_Lose", sender: nil)
            }
    }
    
    @IBAction func button_NextQuestuon(_ sender: Any) {
        viewDidLoad()
    }
    
    @IBAction func button_AnnounceAnswer(_ sender: Any) {
        label_StandardAnswer.text="""
                                  R=\(String(Int(question_red * 255)))
                                  G=\(String(Int(question_green * 255)))
                                  B=\(String(Int(question_blue * 255)))
                                  """
    }
}
