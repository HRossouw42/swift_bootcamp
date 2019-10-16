//
//  ViewController.swift
//  day06
//
//  Created by Harmun Rossouw on 2019/10/16.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
        self.view.addGestureRecognizer(tapGR)
    }
    
    @objc func didTap(tapGR: UITapGestureRecognizer) {
        let tapPoint = tapGR.location(in: self.view)

        let shapeView = ShapeView(origin: tapPoint)

        self.view.addSubview(shapeView)
    }
    



}
