//
//  CAAnimationExtention.swift
//  Game
//
//  Created by Muhammad Sabir on 13/07/2016.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//

import Foundation
import SceneKit

extension CAAnimation {
    class func animationWithSceneNamed(name: String) -> CAAnimation? {
        var animation: CAAnimation?
        if let scene = SCNScene(named: name) {
            scene.rootNode.enumerateChildNodesUsingBlock({ (child, stop) in
                if child.animationKeys.count > 0 {
                    animation = child.animationForKey(child.animationKeys.first!)
                    stop.initialize(true)
                }
            })
        }
        return animation
    }
}
//Bounding Box

extension SCNNode {
    var boundingBox: (min: SCNVector3, max: SCNVector3) {
        get {
            var min = SCNVector3(0, 0, 0)
            var max = SCNVector3(0, 0, 0)
            getBoundingBoxMin(&min, max: &max)
            return (min, max)
        }
    }
}
//Physics match
extension SCNPhysicsContact {
    func match(category category: Int, block: (matching: SCNNode, other: SCNNode) -> Void) {
        if self.nodeA.physicsBody!.categoryBitMask == category {
            block(matching: self.nodeA, other: self.nodeB)
        }
        
        if self.nodeB.physicsBody!.categoryBitMask == category {
            block(matching: self.nodeB, other: self.nodeA)
        }
    }
}
//Action
extension SCNAction {
    
    class func waitForDurationThenRemoveFromParent(duration:NSTimeInterval) -> SCNAction {
        let wait = SCNAction.waitForDuration(duration)
        let remove = SCNAction.removeFromParentNode()
        return SCNAction.sequence([wait,remove])
    }
    
    class func waitForDurationThenRunBlock(duration:NSTimeInterval, block: ((SCNNode!) -> Void) ) -> SCNAction {
        let wait = SCNAction.waitForDuration(duration)
        let runBlock = SCNAction.runBlock { (node) -> Void in
            block(node)
        }
        return SCNAction.sequence([wait,runBlock])
    }
    
    class func rotateByXForever(x:CGFloat, y:CGFloat, z:CGFloat, duration:NSTimeInterval) -> SCNAction {
        let rotate = SCNAction.rotateByX(x, y: y, z: z, duration: duration)
        return SCNAction.repeatActionForever(rotate)
    }
    
}

