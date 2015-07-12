//
//  GameViewController.swift
//  JSprites
//
//  Created by Jozsef Romhanyi on 11.07.15.
//  Copyright (c) 2015 Jozsef Romhanyi. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {

    var gameBoard = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let IPAD   = GV.IPAD//              = UIDevice.currentDevice().model.substring(0, length: 4)
        //gameBoard.frame = CGRectMake(self.view.frame.width / 3, self.view.frame.origin.y, self.view.frame.width * 2 / 3, self.view.frame.height)
        //gameBoard.layer.borderColor = UIColor.blackColor().CGColor
        //gameBoard.layer.borderWidth = 2
        //println("frame:\(gameBoard.frame)")
        let scene:SKScene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
    }
}

