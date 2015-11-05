//: Playground - noun: a place where people can play

import UIKit
import XCPlayground




var str = "Hello, playground"


let w = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))



let line = UIView(frame: CGRect(x: 20, y: 100, width: 1, height: 100))

line.backgroundColor = UIColor.whiteColor()

w.addSubview(line)

//XCPShowView("test", view: w)




let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 667.0, height: 667.0))


XCPShowView("container", view: containerView)

containerView.backgroundColor = UIColor.whiteColor()

let rectangle2 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))
rectangle2.center = containerView.center
rectangle2.layer.cornerRadius = 20.0
rectangle2.backgroundColor = UIColor.blackColor()
containerView.addSubview(rectangle2)

let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
circle.center = containerView.center
circle.layer.cornerRadius = 25.0

let startingColor = UIColor(red: (253.0/255.0), green: (159.0/255.0), blue: (47.0/255.0), alpha: 1.0)
circle.backgroundColor = startingColor

containerView.addSubview(circle);

let rectangle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
rectangle.center = containerView.center
rectangle.layer.cornerRadius = 5.0


rectangle.backgroundColor = UIColor.whiteColor()

containerView.addSubview(rectangle)





func animate ()
{
    
    UIView.animateWithDuration(2.0, animations: { () -> Void in
        let endingColor = UIColor(red: (255.0/255.0), green: (61.0/255.0), blue: (24.0/255.0), alpha: 1.0)
        circle.backgroundColor = endingColor
        
        let scaleTransform = CGAffineTransformMakeScale(3.0, 3.0)
        
        circle.transform = scaleTransform
        rectangle2.transform = scaleTransform
        
        let rotationTransform = CGAffineTransformMakeRotation(3.14)
        let rotationTransform2 = CGAffineTransformMakeRotation(-3.14)

        rectangle.transform = rotationTransform
        rectangle2.transform = rotationTransform2
        }, completion: { finished in
        

            
    })
    
    UIView.animateWithDuration(2.0, delay: 2.0, options: .CurveEaseOut, animations: {
        let endingColor = UIColor(red: (255.0/255.0), green: (61.0/255.0), blue: (24.0/255.0), alpha: 1.0)
        circle.backgroundColor = endingColor
        
        let scaleTransform = CGAffineTransformMakeScale(1.0, 1.0)
        
        circle.transform = scaleTransform
        rectangle2.transform = scaleTransform
        
        let rotationTransform = CGAffineTransformMakeRotation(0)
        
        rectangle.transform = rotationTransform
        rectangle2.transform = rotationTransform
        
        }, completion: { finished in
            animate()

            
    })
    
}
animate()








//




