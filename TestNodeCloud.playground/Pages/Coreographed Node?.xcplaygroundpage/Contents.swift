//: [Previous](@previous)

import Foundation
import UIKit
import XCPlayground

let squareSize = 500

let numberOfDots = 5
let numberOfSources = 1

let animationTime = 1.0

var window = UIView(frame: CGRect(x: 0, y: 0, width: squareSize, height: squareSize))
window.backgroundColor = UIColor(red:0.6, green: 0.65, blue: 0.69, alpha: 1.0)

XCPShowView("mindNode", view: window)

let floatPadding :CGFloat = 50
var starts :NSMutableArray = []

let rightEdge = window.frame.size.width-floatPadding*2
let leftEdge :CGFloat = 0.0
let top :CGFloat = 0.0
let bottom = window.frame.size.height-floatPadding*2
let size = window.frame.size.width-floatPadding*2

var linesGroups :NSMutableArray = []
//
for var i=0; i < numberOfDots; i++ {
    var ee :NSMutableArray = []
    linesGroups.addObject(ee)
}

for var i=0; i < numberOfSources; i++ {
    var xValue = Int(arc4random_uniform(400))
    var yValue = Int(arc4random_uniform(400))
    var center = window.center
    addLineToGroups(linesGroups, point: CGPoint(x: center.x,    y: center.y), window: window)
}

for var i=0; i<numberOfSources; i++ {
    let lineGroup : NSMutableArray = linesGroups.objectAtIndex(0) as! NSMutableArray
    myPathApply(lineGroup[i].path) { element in
        if(element.memory.type == CGPathElementType.MoveToPoint){
            
            print("move(\(element.memory.points[0]))")
            starts.addObject(NSValue(CGPoint:element.memory.points[0]))
        }
    }
}


var newPointsGroup :NSMutableArray = []
var newViewGroup :NSMutableArray = []
let viewColor = UIColor.whiteColor().colorWithAlphaComponent(1.0)

for var i=0; i < numberOfDots; i++ {
    var newPoint = CGPoint(x: 100, y: 100)
    newPointsGroup.addObject(NSValue(CGPoint: newPoint))
    
    var height = Int(arc4random_uniform(16))+4
    
    let view = UIView(frame: (CGRect(x: 100, y: 100, width: height, height: height)))
    view.backgroundColor = viewColor
    view.layer.cornerRadius = view.frame.size.width/2
    window.addSubview(view)
    
    newViewGroup.addObject(view)
}

//let title = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 64))
//title.text = "Node Cloud Playground"
//title.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
//title.layer.borderColor = UIColor.whiteColor().CGColor
//title.layer.borderWidth = 3.0;
//title.textAlignment = NSTextAlignment.Center
//title.font = UIFont(name: "Avenir-Heavy", size: 24)
//title.textColor = UIColor.whiteColor()
//title.center = window.center
//window.addSubview(title)

move(starts, numberOfSources: numberOfSources, numberOfDots: numberOfDots, linesGroups: linesGroups, pointsGroup: newPointsGroup,viewsGroup: newViewGroup, counter: 0)
