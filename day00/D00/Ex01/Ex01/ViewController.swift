//
//  ViewController.swift
//  Ex01
//
//  Created by Harmun Rossouw on 2019/10/07.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var clicked = false;
    @IBAction func clickBtn(_ sender: Any) {
        if (clicked == false){
            helloLabel.text = "This text has changed 🎉"
            clicked = true
        }
        else {
            helloLabel.text = "And again 🎂"
            clicked = false;
        }
     
    }
    
    @IBOutlet weak var helloLabel: UILabel!
}

