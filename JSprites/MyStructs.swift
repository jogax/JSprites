//
//  MyStructs.swift
//  JLinesV2
//
//  Created by Jozsef Romhanyi on 18.04.15.
//  Copyright (c) 2015 Jozsef Romhanyi. All rights reserved.
//

import Foundation
import UIKit

enum LineType: Int, Printable {
    case Unknown = 0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, LastColor
    
    var colorName: String {
        let colorNames = [
            "none",
            "C1",
            "C2",
            "C3",
            "C4",
            "C5",
            "C6",
            "C7",
            "C8",
            "C9",
            "C10",
            "C11",
            "C12",
            "C13",
            "C14",
            "C15",
            "C16",
            "LastColor"
        ]
        
        return colorNames[rawValue]
    }
    
    var colorAbbr: String {
        let colorAbbrs = [
            " ",
            "A",
            "B",
            "C",
            "D",
            "E",
            "F",
            "G",
            "H",
            "I",
            "J",
            "K",
            "L",
            "M",
            "N",
            "O",
            "P",
            " "
        ]
        
        return colorAbbrs[rawValue]
    }
    
    var uiColor: UIColor {
        var uiColorTypes:[UIColor] = GV.colorSets[GV.colorSetIndex]
        
        /*
        var uiColorTypes = [
        UIColor.clearColor(),
        UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1), // Red
        UIColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 1), // Gold
        UIColor(red: 0/255, green: 255/255, blue: 127/255, alpha: 1), // Springgreen
        UIColor(red: 255/255, green: 105/255, blue: 180/255, alpha: 1), // HotPink
        UIColor(red: 0/255, green: 128/255, blue: 0/255, alpha: 1), // green
        UIColor.blueColor(),
        UIColor.magentaColor(),
        UIColor(red: 255/255, green: 218/255, blue: 155/255, alpha: 1), // PeachPuff
        UIColor.purpleColor(),
        UIColor.orangeColor(),
        UIColor.cyanColor(),
        UIColor.brownColor(),
        UIColor.lightGrayColor(),
        UIColor.darkGrayColor(),
        UIColor(red:255/255, green: 228/255, blue: 225/255, alpha:1),
        UIColor(red: 165/255, green: 42/255, blue: 42/255, alpha:1),
        UIColor.blackColor()
        ]
        */
        return uiColorTypes[rawValue]
    }
    
    var description: String {
        return colorName
    }
}

func ==(lhs: LineType, rhs: LineType) -> Bool {
    return lhs.colorName == rhs.colorName
}


enum Choosed: Int{
    case Unknown = 0, Right, Left, Settings, Restart
}
enum GameControll: Int {
    case Finger = 0, JoyStick, Accelerometer, PipeLine
}

struct GV {
    static var vBounds = CGRect(x: 0, y: 0, width: 0, height: 0)
    //static var horNormWert: CGFloat = 0 // Geräteabhängige Constante
    //static var vertNormWert: CGFloat = 0 // Geräteabhängige Constante
    static var notificationCenter = NSNotificationCenter.defaultCenter()
    static let notificationGameControllChanged = "gameModusChanged"
    static let notificationMadeMove = "MadeMove"
    static let notificationJoystickMoved = "joystickMoved"
    static let notificationColorChanged = "colorChanged"
    static var dX: CGFloat = 0
    //static var dY: CGFloat = 0
    //static let accelerometer   = Accelerometer()
    //static var aktColor: LineType = LineType.Unknown
    static var speed: CGSize = CGSizeZero
    static var touchPoint = CGPointZero
    static var gameSize = 5
    static var gameNr = 0
    static var gameSizeMultiplier: CGFloat = 1.0
    static var onIpad = true
    static var ipadKorrektur: CGFloat = 0
/*
    static var maxGameNr = 0
    static var volumeNr = 0 {
        didSet {
            if oldValue != volumeNr {
                gameSize = package!.getGameSize(volumeNr)
                maxGameNr = package!.getMaxNumber(volumeNr)
            }
        }
    }
    static var maxVolumeNr = 0
    static var lineCount: Int = 0 {
        didSet {
            let lineString = GV.language.getText("lines")
            GV.lineCountLabel.text = "\(GV.lineCount) / \(GV.lines.count) \(lineString)"
        }
    }

    static var moveCount: Int = 0 {
        didSet {
            let step = GV.language.getText("steps")
            GV.moveCountLabel.text = "\(GV.moveCount) / \(GV.lines.count) \(step)"
        }
    }
*/
    static var gameControll = GameControll.Finger
    static var joyStickRadius: CGFloat = 0.0
    static var rectSize: CGFloat = 0 // rectSize in Choose Table
    static var gameRectSize: CGFloat = 0 // rectSize in gameboard
    //static var lines = [LineType:Line]()
    static let multiplicator:CGFloat = 0.90
    static var timeAdder = 1
    static let language = Language()
    static var timeCount: Int = 0
    static let TableNumColumns = 5
    static let TableNumRows = 6
    static var aktPage = 0
    
    static let scrollViewName = "ScrollView"
    //static let dataStore = DataStore()
    //static let cloudData = CloudData()
    //static var package: Package?
    static let volumeName: [Int:String] = [0:"5 x 5", 1:"6 x 6", 2:"7 x 7", 3:"8 x 8", 4:"9 x 9"]
    static let volumeNumber: [String:Int] = ["5 x 5":0, "6 x 6":1, "7 x 7":2, "8 x 8":3, "9 x 9":4]
    //static var gameData = MyGames()
    //static var appData = AppData()
    static var sublayer = CALayer()
    static let images = DrawImages()
    
    // Colors
    static let lightSalmonColor     = UIColor(red: 255/255, green: 160/255, blue: 122/255, alpha: 1)
    static let darkTurquoiseColor   = UIColor(red: 0/255,   green: 206/255, blue: 209/255, alpha: 1)
    static let turquoiseColor       = UIColor(red: 64/255,  green: 224/255, blue: 208/255, alpha: 1)
    static let darkBlueColor        = UIColor(red: 0/255,   green: 0/255,   blue: 139/255, alpha: 1)
    static let springGreenColor     = UIColor(red: 0/255,   green: 255/255, blue: 127/255, alpha: 1)
    static let khakiColor           = UIColor(red: 240/255, green: 230/255, blue: 140/255, alpha: 1)
    static let PaleGoldenrodColor   = UIColor(red: 238/255, green: 232/255, blue: 170/255, alpha: 1)
    static let PeachPuffColor       = UIColor(red: 255/255, green: 218/255, blue: 185/255, alpha: 1)
    static let SilverColor          = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
    static let BlackColor           = UIColor(red: 0/255,   green: 0/255,   blue: 0/255,    alpha: 1)
    static let DarkForrestGreen     = UIColor(red: 0x25/0xff, green: 0x41/0xff, blue: 0x17/0xff, alpha: 1)
    static let backgroundColor      = UIColor(red: 0xff/0xff, green: 0xff/0xff, blue: 0xff/0xff, alpha: 1)
    static let lightBackgroundColor = UIColor(red: 0xc3/0xff, green: 0xfd/0xff, blue: 0xb8/0xff, alpha: 1)
    static let clearWhiteColor      = UIColor(red: 0xff/0xff, green: 0xff/0xff, blue: 0xff/0xff, alpha: 0.7)


    // generierung new game
    static let createNewGame = false
    static let debugging = false
    static let debuggingFunctions = false
    static let debuggingTime = false
    static let printGeneratedLine = true

    
    // globale Labels
    
    static let moveCountLabel = UILabel()
    static let lineCountLabel = UILabel()
    
    // ColorSets
    static var colorSetIndex = 0
    static var colorSets = [
        // standerad Colors
        [
            UIColor.clearColor(),
            UIColor(red: 0xff/0xff, green: 0x00/0xff, blue: 0x00/0xff, alpha: 1), // Red
            UIColor(red: 0xff/0xff, green: 0xD7/0xff, blue: 0x00/0xff, alpha: 1), // Gold
            UIColor(red: 0x00/0xff, green: 0xff/0xff, blue: 0x7f/0xff, alpha: 1), // Springgreen
            UIColor(red: 0xff/0xff, green: 0x69/0xff, blue: 0xb4/0xff, alpha: 1), // HotPink
            UIColor(red: 0x00/0xff, green: 0x80/0xff, blue: 0x00/0xff, alpha: 1), // green
            UIColor(red: 0x00/0xff, green: 0x00/0xff, blue: 0xff/0xff, alpha: 1), // blue
            UIColor(red: 0xff/0xff, green: 0x00/0xff, blue: 0xff/0xff, alpha: 1), // magenta
            UIColor(red: 0xff/0xff, green: 0xda/0xff, blue: 0x9b/0xff, alpha: 1), // PeachPuff
            UIColor(red: 0x80/0xff, green: 0x00/0xff, blue: 0x80/0xff, alpha: 1), // purpleColor
            UIColor(red: 0xff/0xff, green: 0xa5/0xff, blue: 0x00/0xff, alpha: 1), // orangeColor
            UIColor(red: 0x00/0xff, green: 0xff/0xff, blue: 0xff/0xff, alpha: 1), // cyanColor
            UIColor(red: 0xa5/0xff, green: 0x2a/0xff, blue: 0x2a/0xff, alpha: 1), // brownColor
            UIColor(red: 0x80/0xff, green: 0x80/0xff, blue: 0x80/0xff, alpha: 1), // darkGrayColor
            UIColor(red: 0xc0/0xff, green: 0xc0/0xff, blue: 0xc0/0xff, alpha: 1), // silver
            UIColor(red: 0xc6/0xff, green: 0xbe/0xff, blue: 0x17/0xff, alpha: 1), // caramel
            UIColor(red: 0x7F/0xff, green: 0x46/0xff, blue: 0x2C/0xff, alpha: 1), // sepia
            UIColor.blackColor()
        ],
        
        // light colors
        [
            UIColor.clearColor(),
            UIColor(red: 0xff/0xff, green: 0x00/0xff, blue: 0x00/0xff, alpha: 1), // Red
            UIColor(red: 0x00/0xff, green: 0xff/0xff, blue: 0x00/0xff, alpha: 1), // Green
            UIColor(red: 0x00/0xff, green: 0x00/0xff, blue: 0xff/0xff, alpha: 1), // Blue
            UIColor(red: 0xff/0xff, green: 0xff/0xff, blue: 0x00/0xff, alpha: 1), // Yellow
            UIColor(red: 0x00/0xff, green: 0xff/0xff, blue: 0xff/0xff, alpha: 1), // Cyan
            UIColor(red: 0xff/0xff, green: 0x00/0xff, blue: 0xff/0xff, alpha: 1), // Magenta
            UIColor(red: 0x80/0xff, green: 0x00/0xff, blue: 0x80/0xff, alpha: 1), // Purple
            UIColor(red: 0x80/0xff, green: 0x00/0xff, blue: 0x00/0xff, alpha: 1), // Maroon
            UIColor(red: 0x80/0xff, green: 0x80/0xff, blue: 0x00/0xff, alpha: 1), // Olive
            UIColor(red: 0x00/0xff, green: 0x80/0xff, blue: 0x00/0xff, alpha: 1), // DarkGreen
            UIColor(red: 0xff/0xff, green: 0xa5/0xff, blue: 0x00/0xff, alpha: 1), // Orange
            UIColor(red: 0x00/0xff, green: 0xa0/0xff, blue: 0x00/0xff, alpha: 1), // DarkBlue
            UIColor(red: 0xa5/0xff, green: 0x2a/0xff, blue: 0x2a/0xff, alpha: 1), // Brown
            UIColor(red: 0x00/0xff, green: 0x20/0xff, blue: 0xc2/0xff, alpha: 1), // Cobalt Blue
            UIColor(red: 0x57/0xff, green: 0xfe/0xff, blue: 0xef/0xff, alpha: 1), // Blue Cyrcon
            UIColor(red: 0x6c/0xff, green: 0xc4/0xff, blue: 0x17/0xff, alpha: 1), // Alien Green
            UIColor.blackColor()
        ],
        [
            UIColor.clearColor(),
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor(red: 0x7f/0xff, green: 0x7f/0xff, blue: 0x7f/0xff, alpha: 1), //
            UIColor.blackColor()
        ],
        
        
    ]
    // Constraints
    // static let myDevice = MyDevice()
    
    static func random(min: Int, max: Int) -> Int {
        let randomInt = min + Int(arc4random_uniform(UInt32(max + 1 - min)))
        return randomInt
    }

    
}

struct GameData {
    var gameName: String
    var gameNumber: Int
    var countLines: Int
    var countMoves: Int {
        didSet {
            var color: CGColor
            if countMoves > 0 {
                switch countMoves {
                    case countLines:    color = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 0.2).CGColor
                    case countLines + 1 ... countLines + 10:
                                        color = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.2).CGColor
                    default:            color = UIColor.clearColor().CGColor
                }
                layer.backgroundColor = color
                layer.setNeedsDisplay()
            }
        }
    }

    
    var countSeconds: Int
    var timeStemp: NSDate
    var layer: CALayer
    
    init() {
        gameName = ""
        gameNumber = 0
        countLines = 0
        countMoves = 0
        countSeconds = 0
        timeStemp = NSDate()
        layer = CALayer()
    }
    init(name: String, number: Int) {
        gameName = name
        gameNumber = number
        countLines = 0
        countMoves = 0
        countSeconds = 0
        timeStemp = NSDate()
        layer = CALayer()
    }
}
/*
struct VolumeData {
    var volume: String
    var games = [GameData]()
    
    init(volumeIndex: Int) {
        volume = GV.package!.getVolumeName(volumeIndex) as String
        for ind in 0..<GV.TableNumRows * GV.TableNumColumns {
            games.append(GameData(name: volume, number: ind))
        }
        
    }

}


struct MyGames {
    var volumes = [VolumeData]()
    
    init() {
        for volumeIndex in 0..<GV.maxVolumeNr {
            volumes.append(VolumeData(volumeIndex: volumeIndex))
        }
    }
}

struct AppData {
    var gameControll: Int64
    var farbSchemaIndex: Int64
    var farbSchemas: String

    init() {
        gameControll = Int64(GameControll.Finger.rawValue)
        farbSchemaIndex = Int64(GV.colorSetIndex)
        farbSchemas = ""
    }
    
}
*/

