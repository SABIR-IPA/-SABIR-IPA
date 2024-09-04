//
//  Character.swift
//  Game
//
//  Created by Muhammad Sabir on 13/07/2016.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//

import Foundation
import SceneKit

class UnrealCharacter {
    var characterNode = SCNNode()
    //  let Level1 = Level1Controller()
    var  characterScene = SCNScene()
    var actionNotAdded = true
    private var cubeAnimation: CAAnimation!
    var walkAnimation: CAAnimation!
    var idleAnimation: CAAnimation!
    var cameraNode = SCNNode()
    var node:SCNNode!
    //  private static let speedFactor = Float(3)
    
    
    init(){
        node = SCNNode()
        characterScene = SCNScene(named: "game.scnassets/Logan.dae")!
        
        characterNode = characterScene.rootNode.childNodeWithName("Logan", recursively: true)!
        node.addChildNode(characterNode)
        
        //        let (min, max) = node.boundingBox
        //        let collisionCapsuleRadius = CGFloat(max.x - min.x) * 0.4
        //        let collisionCapsuleHeight = CGFloat(max.y - min.y)
        //
        //        let characterCollisionNode = SCNNode()
        //        characterCollisionNode.name = "Logan"
        //        characterCollisionNode.position = SCNVector3(0.0, collisionCapsuleHeight * 0.51, 0.0) // a bit too high so that the capsule does not hit the floor
        //        characterCollisionNode.physicsBody = SCNPhysicsBody(type: .Dynamic, shape:SCNPhysicsShape(geometry: SCNCapsule(capRadius: collisionCapsuleRadius, height: collisionCapsuleHeight), options:nil))
        //        characterCollisionNode.physicsBody!.contactTestBitMask = collisionHero | collsionTarget
        //        node.addChildNode(characterCollisionNode)
        //
        
        
        //     characterScene.rootNode.childNodes(characterNode)
        
        //    for child in characterScene.rootNode.childNodes {
        //      if child.name == "Box" {
        //        let characterTopLevelNode = child
        //      characterNode.addChildNode(characterTopLevelNode)
        //      break
        // }
        // }
        
        cubeAnimation = CAAnimation.animationWithSceneNamed("game.scnassets/Logan-idle6.dae")!
        cubeAnimation.usesSceneTimeBase = false
        cubeAnimation.repeatCount = Float.infinity
        
        
        
        //MARK: - 2a set up walk animation with Collada file from Blender
        walkAnimation = CAAnimation.animationWithSceneNamed("game.scnassets/Logan-Run.dae")!
        walkAnimation.fadeInDuration = 0.3
        walkAnimation.fadeOutDuration = 0.5
        //walkAnimation.repeatCount = 2
        
        //MARK: - 1a  set up idle animation with Collada file from Blender
        idleAnimation = CAAnimation.animationWithSceneNamed("game.scnassets/Logan-idle3.dae")!
        idleAnimation.fadeInDuration = 0.2
        idleAnimation.fadeOutDuration = 0.2
        idleAnimation.autoreverses = true
        
        /*
         //MARK: - 2a set up walk animation with Collada file from Blender
         walkAnimation = CAAnimation.animationWithSceneNamed("game.scnassets/Logan-Run.dae")!
         walkAnimation.fadeInDuration = 0.3
         walkAnimation.fadeOutDuration = 0.5
         //walkAnimation.repeatCount = 2
         
         
         //MARK: - 2a set up walk animation with Collada file from Blender
         walkAnimation = CAAnimation.animationWithSceneNamed("game.scnassets/Logan-Run.dae")!
         walkAnimation.fadeInDuration = 0.3
         walkAnimation.fadeOutDuration = 0.5
         //walkAnimation.repeatCount = 2
         
         
         //MARK: - 2a set up walk animation with Collada file from Blender
         walkAnimation = CAAnimation.animationWithSceneNamed("game.scnassets/Logan-Run.dae")!
         walkAnimation.fadeInDuration = 0.3
         walkAnimation.fadeOutDuration = 0.5
         //walkAnimation.repeatCount = 2
         
         
         //MARK: - 2a set up walk animation with Collada file from Blender
         walkAnimation = CAAnimation.animationWithSceneNamed("game.scnassets/Logan-Run.dae")!
         walkAnimation.fadeInDuration = 0.3
         walkAnimation.fadeOutDuration = 0.5
         //walkAnimation.repeatCount = 2
         
         */
        
        
    }
    
    func animate(){
        node.addAnimation(walkAnimation, forKey: "logan")
    }
    
    func idle(){
        node.addAnimation(idleAnimation, forKey: "logan")
        // characterNode.addAnimation(cubeAnimation, forKey: "logan")
    }
    func idle1(){
        node.addAnimation(cubeAnimation, forKey: "logan")
    }
    
    func activateWalking(start:Bool){
        
        if start{
            if actionNotAdded{
                node.addAnimation(walkAnimation, forKey: "logan")
                actionNotAdded = false
                //        Level1.followCamera()
            }
            
        }else{
            node.removeAnimationForKey("logan", fadeOutDuration:0.3)
            actionNotAdded = true
        }
        
    }
    
    
    
    
    
    
}
