//
//  VideoViewController.swift
//  Game
//
//  Created by Harry Dart-O'Flynn on 28/06/2016.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//


import UIKit
import SpriteKit

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = VideoScene(fileNamed:"VideoScene") {
            // Configure the view.
            let skView = self.view as! SKView
//            skView.showsFPS = true
//            skView.showsNodeCount = true
			
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		getOut()
	}
	
	func getOut(){
		self.performSegueWithIdentifier("vidToMenuSegue", sender: nil)
	}
}


































/*
import UIKit
import AVFoundation
import AVKit

class VideoViewController: UIViewController {

	let mainMenu = MainViewController()
	var player = AVPlayer()
	var playerController = AVPlayerViewController()
	override func viewDidAppear(animated:Bool) {
		super.viewDidAppear(animated)
		//UI.addAGradientLayer(self)
		playVideo()
	}
	
	private func playVideo() {
		if let path = NSBundle.mainBundle().pathForResource("WithoutThe", ofType: "mp4") {
			let url = NSURL(fileURLWithPath: path)
			player = AVPlayer(URL: url)
			playerController = AVPlayerViewController()
			playerController.player = player
			playerController.showsPlaybackControls = false
			self.presentViewController(playerController, animated: false) {
				self.player.play()
			}
		}
		else {
			print("Oops, something wrong when playing video.m4v")
		}
	}
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		for touch:AnyObject in touches{
			self.player.pause()
			print("Touched")
			getOut()
		}
	}
	
	func getOut(){
		print("Segue")
		dispatch_async(dispatch_get_main_queue(),{
			self.presentViewController(self.mainMenu, animated: false, completion: nil)
		})
	}
	
	func topMostViewController()->UIViewController{
		
         var topController = UIApplication.sharedApplication().keyWindow?.rootViewController
			while ((topController?.presentedViewController) != nil) {
				topController = topController?.presentedViewController
			}
		return topController!
	}
}


- (UIViewController*) topMostController {
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;

    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }

    return topController;
}
*/