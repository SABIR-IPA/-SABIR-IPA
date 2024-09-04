//
//  LevelOneViewController.swift
//  Game
//
//  Created by Harry Dart-O'Flynn on 25/05/2016.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//

import UIKit
import SceneKit
import QuartzCore
 class LevelOneViewController: UIViewController {


	var sceneView: SCNView?
   // let scene = FirstScene(view)
    var GameScene:FirstScene!
	override func viewDidLoad() {
        super.viewDidLoad()
		
		sceneView = self.view as? SCNView
		if let view = sceneView {
		
			view.scene = GameScene
			view.playing = true
			view.delegate = GameScene
            view.scene?.physicsWorld.contactDelegate = GameScene
            GameScene = FirstScene(currentview: view)
			
		}
		
		let backBtn = UI.createABtn(self, x: 0.5, y: 0.1, w: 0.5, h: 0.2, btnTitle: "Back", fntSize: 30, bg: 0)
		backBtn.addTarget(self, action: #selector(changeToMenu), forControlEvents: .TouchUpInside)

	}
	
	func changeToMenu(){
		self.performSegueWithIdentifier("oneToMainSegue", sender: nil)
		
	}

}
