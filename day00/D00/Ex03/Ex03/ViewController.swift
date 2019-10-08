//
//  ViewController.swift
//  Ex03
//
//  Created by Harmun Rossouw on 2019/10/07.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var inputA: Double = 0
    var inputB: Double = 0
    var isMath: Bool = false
    var symbol = 0
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if (isMath == true){
            outputLabel.text = String(sender.tag-1)
            numberOnScreen = Double(outputLabel.text!)!
            isMath = false
        }
        else {
            outputLabel.text = outputLabel.text! + String(sender.tag-1)
            numberOnScreen = Double(outputLabel.text!)!
        }
        //inputA = numberOnScreen
    }
    
    @IBAction func functionButtons(_ sender: UIButton) {
        if outputLabel.text != "" && sender.tag != 12 && sender.tag != 17 && sender.tag != 11 {
            isMath = true
            inputA = Double(outputLabel.text!)!
            // divide
            if sender.tag == 13 {
                outputLabel.text = "/"
            }
            // multiply
            else if sender.tag == 14 {
                outputLabel.text = "*"
            }
            // subtract
            else if sender.tag == 15 {
                outputLabel.text = "-"
            }
            // addition
            else if sender.tag == 16 {
                outputLabel.text = "+"
            }
            
            symbol = sender.tag
        }
        // if '=' is pressed
        else if sender.tag == 17 {
            // divide
            if symbol == 13 {
                outputLabel.text = String(inputA / numberOnScreen)
            }
            // multiply
            else if symbol == 14 {
                outputLabel.text = String(inputA * numberOnScreen)
            }
            // subtract
            else if symbol == 15 {
                outputLabel.text = String(inputA - numberOnScreen)
            }
            // addition
            else if symbol == 16 {
                outputLabel.text = String(inputA + numberOnScreen)
            }
        }
        // AC resets everything
        else if sender.tag == 12 {
            outputLabel.text = ""
            numberOnScreen = 0
            inputA = 0
            symbol = 0
        }
        else if sender.tag == 11 &&
            outputLabel.text != ""{
            print("REEEEEEE")
            outputLabel.text = String(Double(outputLabel.text!)! * -1)
            print(outputLabel.text!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

