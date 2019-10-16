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
    
    let size: CGFloat = 150.0
    let lineWidth: CGFloat = 3
    var fillColor: UIColor!
    
    //for random shapes
    var path: UIBezierPath!
    
    func randomColor() -> UIColor {
        let hue:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return UIColor(hue: hue, saturation: 0.8, brightness: 1.0, alpha: 0.8)
    }
    
    init(origin: CGPoint) {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.path = randomPath()
        self.fillColor = randomColor()
        self.backgroundColor = UIColor.clear
        self.center = origin
        
        initGestureRecognizers()
    }
    
    //DRAW FUNCTION
    override func draw(_ rect: CGRect) {
        UIColor.red.setFill()
        self.fillColor.setFill()
        path.fill()
        
                
        path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        path.stroke()
    }
    
    //CHOOSE RANDOM SHAPE
    func randomPath() -> UIBezierPath {

        let insetRect = self.bounds.insetBy(dx: lineWidth,dy: lineWidth)

        let shapeType = arc4random() % 3

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
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(ShapeView.didPan(panGR:)))
        addGestureRecognizer(panGR)
        
        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(ShapeView.didPinch(pinchGR:)))
        addGestureRecognizer(pinchGR)
        
        let rotationGR = UIRotationGestureRecognizer(target: self, action: #selector(ShapeView.didRotate(rotationGR:)))
        addGestureRecognizer(rotationGR)
    }
    
    //PAN
    @objc func didPan(panGR: UIPanGestureRecognizer) {

        self.superview!.bringSubviewToFront(self)

        var translation = panGR.translation(in: self)

        
        //reset center after rotate
        translation = translation.applying(self.transform)
        
        self.center.x += translation.x
        self.center.y += translation.y
        
        panGR.setTranslation(CGPoint.zero, in: self)
    }
    
    //PINCH
    @objc func didPinch(pinchGR: UIPinchGestureRecognizer) {

        self.superview!.bringSubviewToFront(self)

        let scale = pinchGR.scale

        self.transform = self.transform.scaledBy(x: scale, y: scale)

        pinchGR.scale = 1.0
    }
    
    //ROTATE
    @objc func didRotate(rotationGR: UIRotationGestureRecognizer) {

        self.superview!.bringSubviewToFront(self)

        let rotation = rotationGR.rotation

        self.transform = CGAffineTransform(rotationAngle: rotation)
        //rotationGR.rotation = 0.0
    }
    
    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
