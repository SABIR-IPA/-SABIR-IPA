//
//  VideoScene.swift
//  Game
//
//  Created by Harry Dart-O'Flynn on 29/06/2016.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//

import SpriteKit
import AVFoundation

class VideoScene: SKScene {


    // Video Sprite Node
    var player:AVPlayer?
    var videoNode:SKVideoNode?

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        // play video

        let urlStr = NSBundle.mainBundle().pathForResource("WithoutThe", ofType: "mp4")
        let url = NSURL(fileURLWithPath: urlStr!)

        player = AVPlayer(URL: url)

        videoNode = SKVideoNode(AVPlayer: player!)
        videoNode?.position = CGPointMake(frame.size.width/2, frame.size.height/2)
        videoNode?.size = CGSize(width: frame.size.width, height: frame.size.height)
        videoNode?.zPosition = 1

        addChild(videoNode!)
        videoNode!.play()
    }
}
