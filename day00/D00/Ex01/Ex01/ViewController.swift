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

    @IBAction func clickBtn(_ sender: Any) {
        helloLabel.text = "This text has changed 🎉"
    }
    
    @IBOutlet weak var helloLabel: UILabel!
}

