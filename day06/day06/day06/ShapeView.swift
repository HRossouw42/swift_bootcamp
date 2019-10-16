//
//  ShapeView.swift
//  day06
//
//  Created by Harmun Rossouw on 2019/10/16.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    
    let size: CGFloat = 150.0
    let lineWidth: CGFloat = 3
    
    init(origin: CGPoint) {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.backgroundColor = UIColor.clear
        self.center = origin
        initGestureRecognizers()

    }
    
    override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        
        let path = UIBezierPath(roundedRect: insetRect, cornerRadius: 10)
        
        UIColor.red.setFill()
        path.fill()
                
        path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        path.stroke()
    }
    
    func initGestureRecognizers() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(ShapeView.didPan(panGR:)))
        addGestureRecognizer(panGR)
        
        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(ShapeView.didPinch(pinchGR:)))
        addGestureRecognizer(pinchGR)
        
        let rotationGR = UIRotationGestureRecognizer(target: self, action: #selector(ShapeView.didRotate(rotationGR:)))
        addGestureRecognizer(rotationGR)
    }
    
    @objc func didPan(panGR: UIPanGestureRecognizer) {

        self.superview!.bringSubviewToFront(self)

        var translation = panGR.translation(in: self)

        
        //reset center after rotate
        translation = translation.applying(self.transform)
        
        self.center.x += translation.x
        self.center.y += translation.y
        
        panGR.setTranslation(CGPoint.zero, in: self)
    }
    
    
    @objc func didPinch(pinchGR: UIPinchGestureRecognizer) {

        self.superview!.bringSubviewToFront(self)

        let scale = pinchGR.scale

        self.transform = self.transform.scaledBy(x: scale, y: scale)

        pinchGR.scale = 1.0
    }
    
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
