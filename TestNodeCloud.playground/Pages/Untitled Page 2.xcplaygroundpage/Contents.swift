//: [Previous](@previous)

import Foundation
import UIKit
import XCPlayground


var str = "Hello, playground"

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 667.0, height: 667.0))


XCPShowView("container", view: containerView)

containerView.backgroundColor = UIColor.whiteColor()


func makeRectangle(x: CGFloat) -> UIView{
    let rectangle = UIView(frame: CGRect(x: (x*100)+300, y: containerView.center.y, width: 100, height: 100))
    rectangle.layer.cornerRadius = 5.0
    rectangle.backgroundColor = UIColor.blackColor()
    return rectangle
}

func animateWithDelayAndHeight(delayFor: CGFloat, height: CGFloat, rectangle: UIView)
{
    UIView.animateWithDuration(1.0, delay: 0, options: .CurveEaseOut, animations: {

        let scaleTransform = CGAffineTransformMakeScale(1.0, height)
        let moveTransform = CGAffineTransformMakeTranslation(0,-1.1)

        rectangle.transform = scaleTransform
        rectangle.transform = moveTransform

        }, completion: { finished in
            animateWithDelayAndHeight(delayFor, height: height, rectangle: rectangle)
    })
}


let rectangle1 = makeRectangle(-3)
let rectangle2 = makeRectangle(-2)
let rectangle3 = makeRectangle(-1)
let rectangle4 = makeRectangle(0)
let rectangle5 = makeRectangle(1)

func animateButtons(){
    animateWithDelayAndHeight(1.0, height: 3, rectangle: rectangle1)
    animateWithDelayAndHeight(1.0, height: 4, rectangle: rectangle2)
    animateWithDelayAndHeight(1.02, height: 5, rectangle: rectangle3)
    animateWithDelayAndHeight(1.0, height: 6, rectangle: rectangle4)
    animateWithDelayAndHeight(1.0, height: 7, rectangle: rectangle5)

}




animateButtons()







containerView.addSubview(rectangle1)
containerView.addSubview(rectangle2)
containerView.addSubview(rectangle3)
containerView.addSubview(rectangle4)
containerView.addSubview(rectangle5)


