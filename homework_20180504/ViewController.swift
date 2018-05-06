//
//  ViewController.swift
//  homework_20180504
//
//  Created by OBO on 2018/5/6.
//  Copyright © 2018年 OBO. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var number1_TextField: UITextField!
    @IBOutlet weak var number2_TextField: UITextField!
    @IBOutlet weak var Ans_Label: UILabel!
    
    @IBOutlet weak var Calculation_SegmentedControl: UISegmentedControl!
    
    @IBAction func Calculation_SegmentedControl(_ sender: Any) {
        if(number1_TextField.text == "")
        {
            number1_TextField.text = "0"
        }
        if(number2_TextField.text == "")
        {
            number2_TextField.text = "0"
        }
        if(number2_TextField.text == "0" && Calculation_SegmentedControl.selectedSegmentIndex == 3)
        {
            number2_TextField.text = "1"
        }
        
        let number1: Double? = Double(number1_TextField.text!)
        let number2: Double? = Double(number2_TextField.text!)
        var sum: Double? = 0
       if(Calculation_SegmentedControl.selectedSegmentIndex == 0)
       {
            sum = number1! + number2!
       }
        else if(Calculation_SegmentedControl.selectedSegmentIndex == 1)
       {
            sum = number1! - number2!
        }
       else if(Calculation_SegmentedControl.selectedSegmentIndex == 2)
       {
            sum = number1! * number2!
        }
        else
       {
            sum = number1! / number2!
        }
        
        Ans_Label.text = String(format: "%.1f", sum!)
        let speedchUtterance = AVSpeechUtterance(string: Ans_Label.text!)
        speedchUtterance.rate = 0.5
        speedchUtterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speedchUtterance)
        
    }
}

