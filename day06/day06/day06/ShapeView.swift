//
//  ShapeView.swift
//  day06
//
//  Created by Harmun Rossouw on 2019/10/16.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    
    // Shapes tutorial
    //https://www.weheartswift.com/bezier-paths-gesture-recognizers/
    
    // Gravity
    //https://www.raywenderlich.com/2326-uikit-dynamics-tutorial-getting-started
    
    let size: CGFloat = 100.0
    let lineWidth: CGFloat = 3
    var fillColor: UIColor!
    
    //for random shapes
    var path: UIBezierPath!
    
    //ANIMATION
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var behaviour: UIDynamicItemBehavior!
    var originalBounds: CGRect!
    
    func randomColor() -> UIColor {
        let hue:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return UIColor(hue: hue, saturation: 0.8, brightness: 1.0, alpha: 0.8)
    }
        
    init(origin: CGPoint, animator: UIDynamicAnimator, gravity: UIGravityBehavior, collision: UICollisionBehavior, behaviour: UIDynamicItemBehavior){
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.center = origin
        self.backgroundColor = UIColor.clear
        self.fillColor = randomColor()
        
        //shape
        self.path = randomPath()
        
        //animations
        self.animator = animator
        self.gravity = gravity
        self.collision = collision
        self.behaviour = behaviour
        
        self.originalBounds = CGRect(x: 0.0, y: 0.0, width: size, height: size)
        
        //register gestures
        initGestureRecognizers()
    }
    
    //DRAW FUNCTION
    override func draw(_ rect: CGRect) {
        print("DO DRAW?")
        self.fillColor.setFill()
        self.path.fill()
        
        self.path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        self.path.stroke()
        print("I DID A DRAW")
    }
    
    //CHOOSE RANDOM SHAPE
    func randomPath() -> UIBezierPath {
        
        let insetRect = self.bounds.insetBy(dx: lineWidth,dy: lineWidth)
        
        let shapeType = arc4random() % 3
        print("Shape type -> \(shapeType)")
        
        if shapeType == 0 {
            return UIBezierPath(roundedRect: insetRect, cornerRadius: 10.0)
        }
        
        if shapeType == 1 {
            return UIBezierPath(ovalIn: insetRect)
        }
        return trianglePathInRect(rect: insetRect)
    }
    
    //DRAW TRIANGLE
    func trianglePathInRect(rect:CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: rect.width / 2.0, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.width,y: rect.height))
        path.addLine(to: CGPoint(x: rect.origin.x,y: rect.height))
        path.close()
        
        return path
    }
    
    //TOUCH FUNCTIONS
    func initGestureRecognizers() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(ShapeView.didPan))
        addGestureRecognizer(panGR)
        
        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(ShapeView.didPinch))
        addGestureRecognizer(pinchGR)
        
        let rotationGR = UIRotationGestureRecognizer(target: self, action: #selector(ShapeView.didRotate))
        addGestureRecognizer(rotationGR)
    }
    
    //PAN
    @objc func didPan(panGR: UIPanGestureRecognizer) {
        switch panGR.state {
            
        case .began:
            self.gravity?.removeItem(panGR.view!);
            
        case .changed:
            panGR.view?.center = panGR.location(in: self.superview);
            self.animator?.updateItem(usingCurrentState: panGR.view!);
            
        case .ended:
            self.gravity?.addItem(panGR.view!);
            
        default:
            break ;
        }
    }
    
    //PINCH
    @objc func didPinch(pinchGR: UIPinchGestureRecognizer) {
        let view = pinchGR.view as! ShapeView;
        
        switch pinchGR.state {
            
        case .began:
            self.gravity?.removeItem(view);
            
        case .changed:
            self.collision.removeItem(view);
            self.behaviour.removeItem(view);
            view.bounds.size.width = view.originalBounds.width * pinchGR.scale;
            view.bounds.size.height = view.originalBounds.height * pinchGR.scale;
            self.collision.addItem(view);
            self.behaviour.addItem(view);
            self.animator?.updateItem(usingCurrentState: view);
            
        case .ended:
            view.originalBounds = view.bounds;
            self.gravity?.addItem(view);
        default:
            break ;
        }
    }
    
    //ROTATE
    @objc func didRotate(rotationGR: UIRotationGestureRecognizer) {
        switch rotationGR.state {
            
        case .began:
            self.gravity.removeItem(rotationGR.view!);
            
        case .changed:
            self.collision.removeItem(rotationGR.view!);
            self.behaviour.removeItem(rotationGR.view!);
            rotationGR.view!.transform = rotationGR.view!.transform.rotated(by: rotationGR.rotation);
            rotationGR.rotation = 0;
            self.collision.addItem(rotationGR.view!);
            self.behaviour.addItem(rotationGR.view!);
            self.animator?.updateItem(usingCurrentState: rotationGR.view!);
            
        case .ended:
            self.gravity?.addItem(rotationGR.view!);
            
        default:
            break ;
        }
    }
    
    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
