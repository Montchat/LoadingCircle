//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let currentPage = XCPlaygroundPage.currentPage


//Class that creates a custom background view with color and height
class CircleView : UIView {
    
    typealias X = CGFloat; typealias Y = CGFloat
    typealias Height = CGFloat ; typealias Width = CGFloat
    
    init(x:X, y:Y, height:Height, width:Width, color: UIColor) {
        
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        
        self.backgroundColor = color
        self.layer.cornerRadius = width / 2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

let color = UIColor(red: 0.41, green: 0.41, blue: 0.41, alpha: 0.90)
let whiteColor = UIColor.whiteColor()

let backgroundView = CircleView(x: 0, y: 0, height: 300, width: 300, color: color)

currentPage.liveView = backgroundView
currentPage.needsIndefiniteExecution = true

func addCirclesToView(view:UIView, count: CGFloat, color:UIColor) -> [CircleView] {
    
    var circleViews:[CircleView] = []
    
    for i in 1 ... Int(count) {
        
        let x = view.frame.width / count * CGFloat(i) - (view.frame.width / count / 2)
        let y = view.center.y
        
        let width = view.frame.width / count / 2
        let height = width
        
        let circle = CircleView(x: 0, y: 0, height: height, width: width, color: whiteColor)
        
        circle.center.x = x
        circle.center.y = y
        
        circleViews.append(circle)
        
        view.addSubview(circle)
        
    }
    
    return circleViews
    
}

func animateViewsSequentially(views views: [UIView], duration: Double) {
    
    let j = views.count
    
    for var i in 0 ..< j {
        
        let view = views[i]
        
        UIView.animateWithDuration(duration, delay: 0, options: [.Autoreverse,.Repeat], animations: {
            view.alpha = 0
            
            }, completion: { (Bool) in
                
                i += 1
                
        })
        
    }
    
}

let circleViews = addCirclesToView(backgroundView, count: 3, color: color)

animateViewsSequentially(views: circleViews, duration: 0.33)
animateViewsSequentially(views: [backgroundView], duration: 0.825)





















