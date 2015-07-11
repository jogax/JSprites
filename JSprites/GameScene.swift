//
//  GameScene.swift
//  JSprites
//
//  Created by Jozsef Romhanyi on 11.07.15.
//  Copyright (c) 2015 Jozsef Romhanyi. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let images = DrawImages()
    let maxGeneratedColorCount = 10
    let countContainers = 4
    var timer: NSTimer?
    var containers = [SKSpriteNode]()
    var countColorsProContainer = [Int]()
    
    override func didMoveToView(view: SKView) {
        let xDelta = size.width / CGFloat(countContainers)
        for index in 0..<countContainers {
            let aktColor = GV.colorSets[GV.colorSetIndex][index + 1].CGColor
            let containerTexture = SKTexture(image: images.drawCircle(CGSizeMake(50,50), imageColor: aktColor))
            containers.append(SKSpriteNode(texture: containerTexture))
            let xPoint = (size.width / CGFloat(countContainers)) * CGFloat(index) + xDelta / 2
            containers[index].position = CGPoint(x: xPoint, y: size.height * 0.85)
            countColorsProContainer.append(maxGeneratedColorCount)
            addChild(containers[index])
        }
        backgroundColor = UIColor.whiteColor() //SKColor.whiteColor()
        generateSprite()
    }
    func generateSprite() {
        let nextTime = Double(GV.random(5, max: 30)) / 15
        var colorTab = [Int]()
        for index in 0..<countColorsProContainer.count {
            if countColorsProContainer[index] > 0 {
                colorTab.append(index)
            }
        }
        if colorTab.count > 0 {
            let colorIndex = colorTab[GV.random(0, max: colorTab.count - 1)]
            countColorsProContainer[colorIndex]--
            let aktColor = GV.colorSets[GV.colorSetIndex][colorIndex + 1].CGColor
            self.timer = NSTimer.scheduledTimerWithTimeInterval(nextTime, target: self, selector: Selector("generateSprite"), userInfo: nil, repeats: false)
            let containerTexture = SKTexture(image: images.drawCircle(CGSizeMake(30,30), imageColor: aktColor))
            let sprite = SKSpriteNode(texture: containerTexture)
            let xPosition = size.width * CGFloat(GV.random(20, max: 80)) / 100
            let yPosition = size.height * CGFloat(GV.random(20, max: 80)) / 100
            sprite.position = CGPoint(x: xPosition, y: yPosition)
            //points.append(point)
            //point!.backgroundColor = playColors[color]
            //point!.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
            addChild(sprite)
            //point.layer.name = "\(points.count)"
            
            //println("Anzahl Sprites: \(MySprite.spritesCount)")
            //setupLayoutForPoint(point!)
        } else {
            /*
            var gameEndAlert:UIAlertController?
            var messageTxt = GV.language.getText("restart")
            gameEndAlert = UIAlertController(title: GV.language.getText("timeout"),
                message: messageTxt,
                preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK",
                style: UIAlertActionStyle.Default,
                handler: {(paramAction:UIAlertAction!) in
                    //self.firstGameView!.restart()
                    //self.timeLeft = self.timeLeftOrig
                    GV.timeCount = 0
                    GV.timeAdder = 1
                }
            )
            
            
            //timeEndAlert!.addAction(OKAction)
            presentViewController(timeEndAlert!,
                animated:true,
                completion: nil)
     */       
        }
        


    }

}
