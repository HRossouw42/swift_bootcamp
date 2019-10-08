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
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        outputLabel.text = outputLabel.text! + String(sender.tag-1)
        numberOnScreen = Double(outputLabel.text!)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

