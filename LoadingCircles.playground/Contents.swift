//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let currentPage = XCPlaygroundPage.currentPage

let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
backgroundView.backgroundColor = UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 0.90)
backgroundView.layer.masksToBounds = true
backgroundView.layer.cornerRadius = 10

currentPage.liveView = backgroundView

currentPage.needsIndefiniteExecution = true

func addCirclesToView(view:UIView, count: CGFloat) {
    
    for var i in 1 ... Int(count) {
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: (view.frame.width / count) * CGFloat(i) / 2 , y: view.frame.midY), radius: CGFloat(view.frame.width / count / 4), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.whiteColor().CGColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        
        backgroundView.layer.addSublayer(shapeLayer)
        
        i += 1
        
    }
    
}

addCirclesToView(backgroundView, count: 2)



