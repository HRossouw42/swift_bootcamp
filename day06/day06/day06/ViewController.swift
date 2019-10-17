//
//  ViewController.swift
//  day06
//
//  Created by Harmun Rossouw on 2019/10/16.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator = UIDynamicAnimator()
    var gravity: UIGravityBehavior = UIGravityBehavior()
    var collision: UICollisionBehavior = UICollisionBehavior()
    let behaviour = UIDynamicItemBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
        self.view.addGestureRecognizer(tapGR)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        gravity.gravityDirection = CGVector(dx: 0.0, dy: 0.8)
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        behaviour.elasticity = 0.9
        animator.addBehavior(behaviour)
    }
    
    @objc func didTap(tapGR: UITapGestureRecognizer) {
        print("Tippy Tap!")
        let tapPoint = tapGR.location(in: self.view)
        
        let shapeView = ShapeView(origin: tapPoint, animator: animator, gravity: gravity, collision: collision, behaviour: behaviour)
        
        self.view.addSubview(shapeView)
        gravity.addItem(shapeView)
        collision.addItem(shapeView)
        behaviour.addItem(shapeView)
        
        
    }
}
