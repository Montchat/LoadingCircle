//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let currentPage = XCPlaygroundPage.currentPage

class RoundedView : UIView {
    
    typealias Height = CGFloat ; typealias Width = CGFloat ; typealias CornerRadius = CGFloat
    
    init(height:Height, width:Width, color: UIColor, cornerRadius:CornerRadius) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        self.backgroundColor = color
        self.layer.cornerRadius = cornerRadius
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

let color = UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 0.90)

let backgroundView = RoundedView(height: 300, width: 300, color: color, cornerRadius: 10)

currentPage.liveView = backgroundView
currentPage.needsIndefiniteExecution = true

func addCirclesToView(view:UIView, count: CGFloat) {
    
    for var i in 1 ... Int(count) {
        
        let circleX = view.frame.width / count * CGFloat(i) - (view.frame.width / count / 2)
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: circleX, y: view.frame.midY), radius: CGFloat(view.frame.width / count / 4), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        
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

addCirclesToView(backgroundView, count: 3)

















