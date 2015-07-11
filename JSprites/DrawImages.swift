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
    
    init() {
    }
    
    func drawCircle(size: CGSize, imageColor: CGColor) -> UIImage {
        let size = size
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
    

    

}
