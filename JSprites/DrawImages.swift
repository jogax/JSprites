//
//  DrawImages.swift
//  JLinesV2
//
//  Created by Jozsef Romhanyi on 30.04.15.
//  Copyright (c) 2015 Jozsef Romhanyi. All rights reserved.
//

import Foundation
import UIKit

class DrawImages {
    let opaque = false
    let scale: CGFloat = 1
    let oneGrad = CGFloat(M_PI / 180)
    
    init() {
    }
    
    func drawCircle(size: CGSize, imageColor: CGColor) -> UIImage {
        let size = size
        Let a = 0
        let endAngle = CGFloat(2*M_PI)

        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let ctx = UIGraphicsGetCurrentContext()
        CGContextBeginPath(ctx)
        
        CGContextSetLineWidth(ctx, 1.0)
        let rect = CGRectMake(0, 0, size.width, size.height);
        let center = CGPoint(x: 0 + size.width / 2, y: 0 + size.height / 2)
        let r0 = size.width / 2.1

        CGContextSetFillColorWithColor(ctx, imageColor)

        CGContextAddArc(ctx, center.x, center.y, r0, 0, endAngle, 1)

        CGContextDrawPath(ctx, kCGPathFill);
        CGContextFillPath(ctx)

        //CGContextFillRect(ctx, rect);
        //CGContextSetFillColorWithColor(ctx, imageColor)

        CGContextStrokePath(ctx)
        

        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
    }

    
    func drawButton(size: CGSize, imageColor: CGColor) -> UIImage {
        let size = CGSizeMake(size.width * 0.95, size.height * 0.95)
        let startAngle = CGFloat(0 * oneGrad)
        let endAngle = CGFloat(180 * oneGrad)
        
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let ctx = UIGraphicsGetCurrentContext()
        CGContextBeginPath(ctx)
        
        CGContextSetLineWidth(ctx, 1.0)
        let center1 = CGPoint(x: 0 + size.height / 4,              y:  size.height / 4)
        let center2 = CGPoint(x: size.width - size.height / 4, y: size.height / 4)
        let center3 = CGPoint(x: size.width - size.height / 4,  y: size.height - size.height / 4)
        let center4 = CGPoint(x: size.height / 4,           y: size.height - size.height / 4)
        
        let p1 = CGPoint(x: 0 ,                             y: 0 + size.height / 4)
        let p2 = CGPoint(x: 0 + size.height / 4,            y: 0.5)
        let p3 = CGPoint(x: size.width - size.height / 4,   y: 0.5)
        let p4 = CGPoint(x: size.width,                     y: 0 + size.height / 4)
        let p5 = CGPoint(x: size.width,                     y: size.height - size.height / 4)
        let p6 = CGPoint(x: size.width - size.height / 4,   y: 0 + size.height)
        let p7 = CGPoint(x: 0  + size.height / 4,           y: 0 + size.height)
        let p8 = CGPoint(x: 0,                              y: size.height - size.height / 4)
        
        
        let r = size.height / 4
        
        CGContextSetFillColorWithColor(ctx, imageColor)
        
        CGContextAddArc(ctx, center1.x, center1.y, r, 270 * oneGrad, 180 * oneGrad, 1)
        CGContextStrokePath(ctx)
 
        CGContextMoveToPoint(ctx, p2.x, p2.y)
        CGContextAddLineToPoint(ctx, p3.x, p3.y)
        CGContextStrokePath(ctx)

        CGContextAddArc(ctx, center2.x, center2.y, r, 360 * oneGrad, 270 * oneGrad, 1)
        CGContextStrokePath(ctx)

        CGContextMoveToPoint(ctx, p4.x, p4.y)
        CGContextAddLineToPoint(ctx, p5.x, p5.y)
        CGContextStrokePath(ctx)

        CGContextAddArc(ctx, center3.x, center3.y, r, 90 * oneGrad, 0 * oneGrad, 1)
        CGContextStrokePath(ctx)

        CGContextMoveToPoint(ctx, p6.x, p6.y)
        CGContextAddLineToPoint(ctx, p7.x, p7.y)
        CGContextStrokePath(ctx)

        CGContextAddArc(ctx, center4.x, center4.y, r, 180 * oneGrad, 90 * oneGrad, 1)
        CGContextStrokePath(ctx)

        CGContextMoveToPoint(ctx, p8.x, p8.y)
        CGContextAddLineToPoint(ctx, p1.x, p1.y)
        CGContextStrokePath(ctx)

        CGContextDrawPath(ctx, kCGPathFill);
        CGContextFillPath(ctx)
        
        //CGContextFillRect(ctx, rect);
        //CGContextSetFillColorWithColor(ctx, imageColor)
        
        CGContextStrokePath(ctx)
        
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
    }

    func pointOfCircle(radius: CGFloat, center: CGPoint, angle: CGFloat) -> CGPoint {
        let pointOfCircle = CGPoint (x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        return pointOfCircle
    }

    func drawSettings(frame: CGRect) -> UIImage {
        let size = CGSize(width: frame.width, height: frame.height)
        let endAngle = CGFloat(2*M_PI)
        
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let ctx = UIGraphicsGetCurrentContext()
        CGContextBeginPath(ctx)
        
        /*
        CGContextSetLineWidth(ctx, 0.5)
        let center1 = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let radius1 = frame.width / 2 - 5
        CGContextAddArc(ctx, center1.x, center1.y, radius1, CGFloat(0), CGFloat(2 * M_PI), 1)
        CGContextSetFillColorWithColor(ctx, imageColor)
        CGContextDrawPath(ctx, kCGPathFillStroke)
        CGContextStrokePath(ctx)
        */
        CGContextSetLineWidth(ctx, 4.0)
        
        let adder:CGFloat = 10.0
        let center = CGPoint(x: frame.origin.x + frame.width / 2, y: frame.origin.y + frame.height / 2)
        let r0 = frame.width / 2.2 - adder
        let r1 = frame.width / 3.0 - adder
        let r2 = frame.width / 4.0 - adder
        let count: CGFloat = 8
        let countx2 = count * 2
        let firstAngle = (endAngle / countx2) / 2
        
        CGContextSetFillColorWithColor(ctx,
            UIColor.whiteColor().CGColor)
        
        //CGContextSetRGBFillColor(ctx, UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1).CGColor);
        for ind in 0..<Int(count) {
            let minAngle1 = firstAngle + CGFloat(ind) * endAngle / count
            let maxAngle1 = minAngle1 + endAngle / countx2
            let minAngle2 = maxAngle1
            let maxAngle2 = minAngle2 + endAngle / countx2
            
            
            let startP = pointOfCircle(r1, center: center, angle: maxAngle1)
            let midP1 = pointOfCircle(r0, center: center, angle: maxAngle1)
            let midP2 = pointOfCircle(r0, center: center, angle: maxAngle2)
            let endP = pointOfCircle(r1, center: center, angle: maxAngle2)
            CGContextAddArc(ctx, center.x, center.y, r0, max(minAngle1, maxAngle1) , min(minAngle1, maxAngle1), 1)
            CGContextStrokePath(ctx)
            CGContextMoveToPoint(ctx, startP.x, startP.y)
            CGContextAddLineToPoint(ctx, midP1.x, midP1.y)
            CGContextStrokePath(ctx)
            CGContextAddArc(ctx, center.x, center.y, r1, max(minAngle2, maxAngle2), min(minAngle2, maxAngle2), 1)
            CGContextStrokePath(ctx)
            CGContextMoveToPoint(ctx, midP2.x, midP2.y)
            CGContextAddLineToPoint(ctx, endP.x, endP.y)
            CGContextStrokePath(ctx)
        }
        CGContextFillPath(ctx)
        
        CGContextAddArc(ctx, center.x, center.y, r2, 0, endAngle, 1)
        CGContextStrokePath(ctx)
        
        /*
        let center2 = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let radius = frame.width / 2 - 5
        CGContextAddArc(ctx, center2.x, center2.y, radius, CGFloat(0), CGFloat(2 * M_PI), 1)
        CGContextStrokePath(ctx)
        */
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
    }

    

}
