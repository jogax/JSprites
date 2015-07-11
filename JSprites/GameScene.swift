//
//  GameScene.swift
//  JSprites
//
//  Created by Jozsef Romhanyi on 11.07.15.
//  Copyright (c) 2015 Jozsef Romhanyi. All rights reserved.
//

import SpriteKit

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
}

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Container : UInt32 = 0b1       // 1
    static let Sprite    : UInt32 = 0b10      // 2
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    let images = DrawImages()
    let maxGeneratedColorCount = 10
    let countContainers = 4
    var timer: NSTimer?
    var containers = [SKSpriteNode]()
    var countColorsProContainer = [Int]()
    var movedFromNode: SKNode!
    
    override func didMoveToView(view: SKView) {
        let xDelta = size.width / CGFloat(countContainers)
        for index in 0..<countContainers {
            let aktColor = GV.colorSets[GV.colorSetIndex][index + 1].CGColor
            let containerTexture = SKTexture(image: images.drawCircle(CGSizeMake(50,50), imageColor: aktColor))
            let centerX = (size.width / CGFloat(countContainers)) * CGFloat(index) + xDelta / 2
            let centerY = size.height * 0.85
            containers.append(SKSpriteNode(texture: containerTexture))
            containers[index].position = CGPoint(x: centerX, y: centerY)
            containers[index].name = "\(index)"
            containers[index].physicsBody = SKPhysicsBody(rectangleOfSize: containers[index].size) // 1
            containers[index].physicsBody?.dynamic = true // 2
            containers[index].physicsBody?.categoryBitMask = PhysicsCategory.Container // 3
            containers[index].physicsBody?.contactTestBitMask = PhysicsCategory.Sprite // 4
            containers[index].physicsBody?.collisionBitMask = PhysicsCategory.None // 5
            countColorsProContainer.append(maxGeneratedColorCount)
            addChild(containers[index])
        }
        backgroundColor = UIColor.whiteColor() //SKColor.whiteColor()
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
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
            sprite.name = "\(10000 + 100 * (colorIndex) + maxGeneratedColorCount - countColorsProContainer[colorIndex])"
            let generatedName = sprite.name
            addChild(sprite)
        } else {
        }
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let countTouches = touches.count
        let firstTouch = touches.first as! UITouch
        let touchLocation = firstTouch.locationInNode(self)
        let node = self.nodeAtPoint(touchLocation)
        if node.name?.toInt() >= 10000 {
            movedFromNode = self.nodeAtPoint(touchLocation)
        } else {
            movedFromNode = nil
        }
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        if movedFromNode != nil {
            let countTouches = touches.count
            let firstTouch = touches.first as! UITouch
            let touchLocation = firstTouch.locationInNode(self)

            let node = self.nodeAtPoint(touchLocation)
            node.physicsBody = SKPhysicsBody(circleOfRadius: node. .size.width/2)
            node.physicsBody?.dynamic = true
            node.physicsBody?.categoryBitMask = PhysicsCategory.Sprite
            node.physicsBody?.contactTestBitMask = PhysicsCategory.Container
            node.physicsBody?.collisionBitMask = PhysicsCategory.None
            node.physicsBody?.usesPreciseCollisionDetection = true
            let offset = touchLocation - movedFromNode.position

            let direction = offset.normalized()
            
            // 7 - Make it shoot far enough to be guaranteed off screen
            let shootAmount = direction * 1000
            
            // 8 - Add the shoot amount to the current position
            let realDest = shootAmount + movedFromNode.position
            
            // 9 - Create the actions
            let actionMove = SKAction.moveTo(realDest, duration: 2.0)
            let actionMoveDone = SKAction.removeFromParent()
            movedFromNode.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        }
    }

}
