//
//  S.swift
//  Game
//
//  Created by Muhammad Sabir on 8/5/16.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//

import Foundation
import SceneKit
class particles{
    var node = SCNNode()
    var wireNode = SCNNode()
    var wireScene = SCNScene()
    init(){
        
//        wireScene = SCNScene(named: "game.scnassets/Fence/fenceFinal.dae")!
//        //
//        //        wireNode = wireScene.rootNode.childNodeWithName("Gear", recursively: true)!
//        //        wireNode.position = SCNVector3(x:0,y:1,z:-20)
//        //       node.addChildNode(wireNode)
//        wireNode = wireScene.rootNode.childNodeWithName("FENCE", recursively: true)!
//        node.addChildNode(wireNode)
//        wireNode.position = SCNVector3(x:0,y:1,z:-15)
//        wireNode.eulerAngles = SCNVector3(x:0,y:Float(M_PI/2),z:0)
//        let Material = SCNMaterial()
//        Material.diffuse.contents = "game.scnassets/Textures/Wood_Cherry_Original.jpg"
//        wireNode.geometry!.materials = [Material]
//        node.addChildNode(wireNode)
        
        
        var CoinsLayer1 = [-1,-3,-5,-7,-9,-11,-13,-15,-17,-19,-21,-23,-25,-27,-29,-31,-33,-35,-37,-39,-41,-43,-45,-47,-49,-51,-53,-55,-57,-59,-61,-63,-65,-67,-69]
        var CoinsLayer2 = [-71,-73,-75,-77,-79,-81,-83,-85,-87,-89,-91,-93,-95,-97,-99,-101,-103,-105,-107,-109,-111,-113,-115,-117,-119,-121,-123,-125,-127,-129]
        var CoinsLayer3 = [-131,-133,-135,-137,-139,-141,-143,-145,-147,-149,-151,-153,-155,-157,-159,-161,-163,-165,-167,-169,-171,-173,-175,-177,-179,-181,-183,-185,-187,-189,-191,-193,-195,-197,-199,-201,-203,-205,-207,-209,-211,-213,-215,-217,-219,-221,-223,-225,-227,-229,-231,-233,-235,-237,-239,-242,-243,-245,-247,-249 ]
        var CoinsLayer4 = [ -251,-253,-255,-257,-259,-261,-263,-265,-267,-269,-271,-273,-275,-277,-279,-281,-283,-285,-287,-289,-291,-293,-295,-297,-299 ]
        var CoinsLayer5 = [ -301,-303,-305,-307,-309,-311,-313,-315,-317,-319,-321,-323,-325,-327,-329,-331,-333,-335,-337,-339,-341,-343,-345,-347,-349,-351,-353,-355,-357,-359 ]
        var CoinsLayer6 = [ -361,-363,-365,-367,-369,-371,-373,-375,-377,-379,-381,-383,-385,-387,-389,-391,-393,-395,-397,-399,-401,-403,-405,-407,-409,-411,-413,-415,-417,-419,-421,-423,-425,-427,-429,-431,-433,-435,-437,-439,-441,-443,-445,-447,-449,-451]
        var CoinsLayer7 = [-451,-453,-455,-457,-459,-461,-463,-465,-467,-469,-471,-473,-375,-477,-479,-481,-483,-485,-487,-489,-491,-493,-495,-497,-499]
        var CoinsLayer8 = [-499,-501,-503,-505,-507,-509,-511,-513,-515,-517,-519,-521,-523,-525,-527,-529,-531,-533,-535,-537,-539,-541,-543,-545,-547,-549,-551,-555,-557,-559,-561-563,-565,-567,-569,-571,-573,-575,-577,-579]
        for index in 0..<CoinsLayer1.count{
            let layer1 = CGFloat(CoinsLayer1[index])
            
            
            let CoinNode = SCNNode()
            CoinNode.geometry = SCNCylinder(radius: 0.5, height: 0.08)
            CoinNode.physicsBody = SCNPhysicsBody(type: .Dynamic, shape: SCNPhysicsShape(geometry: CoinNode.geometry!, options: nil))
            
            CoinNode.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 0.6, z: 0.6, duration: 1.0)))
            let CoinMaterial = SCNMaterial()
            CoinMaterial.diffuse.contents = UIColor.yellowColor()
            CoinNode.geometry!.materials = [CoinMaterial]
            node.addChildNode(CoinNode)
            CoinNode.position = SCNVector3(x:0,y:5,z:Float(layer1))
            
            
        }
        for index in 0..<CoinsLayer2.count{
            let layer2 = CGFloat(CoinsLayer2[index])
            
            
            let CoinNode2 = SCNNode()
            CoinNode2.geometry = SCNCylinder(radius: 0.2, height: 0.08)
            CoinNode2.physicsBody = SCNPhysicsBody(type: .Dynamic, shape: SCNPhysicsShape(geometry: CoinNode2.geometry!, options: nil))
            
            CoinNode2.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 0.6, z: 0.6, duration: 1.0)))
            let CoinMaterial2 = SCNMaterial()
            CoinMaterial2.diffuse.contents = UIColor.yellowColor()
            CoinNode2.geometry!.materials = [CoinMaterial2]
            node.addChildNode(CoinNode2)
            CoinNode2.position = SCNVector3(x:20,y:5,z:Float(layer2))
            
        }
        for index in 0..<CoinsLayer3.count{
            let layer3 = CGFloat(CoinsLayer3[index])
            
            
            let CoinNode3 = SCNNode()
            CoinNode3.geometry = SCNCylinder(radius: 0.2, height: 0.08)
            CoinNode3.physicsBody = SCNPhysicsBody(type: .Dynamic, shape: SCNPhysicsShape(geometry: CoinNode3.geometry!, options: nil))
            
            CoinNode3.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 0.6, z: 0.6, duration: 1.0)))
            let CoinMaterial3 = SCNMaterial()
            CoinMaterial3.diffuse.contents = UIColor.yellowColor()
            CoinNode3.geometry!.materials = [CoinMaterial3]
            node.addChildNode(CoinNode3)
            CoinNode3.position = SCNVector3(x:8,y:5,z:Float(layer3))
            
            
        }
        for index in 0..<CoinsLayer4.count{
            let layer4 = CGFloat(CoinsLayer4[index])
            
            
            let CoinNode4 = SCNNode()
            CoinNode4.geometry = SCNCylinder(radius: 0.2, height: 0.08)
            CoinNode4.physicsBody = SCNPhysicsBody(type: .Dynamic, shape: SCNPhysicsShape(geometry: CoinNode4.geometry!, options: nil))
            
            CoinNode4.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 0.6, z: 0.6, duration: 1.0)))
            let CoinMaterial4 = SCNMaterial()
            CoinMaterial4.diffuse.contents = UIColor.yellowColor()
            CoinNode4.geometry!.materials = [CoinMaterial4]
            node.addChildNode(CoinNode4)
            CoinNode4.position = SCNVector3(x:-5,y:2,z:Float(layer4))
            
            
        }
        for index in 0..<CoinsLayer5.count{
            let layer5 = CGFloat(CoinsLayer5[index])
            
            
            let CoinNode5 = SCNNode()
            CoinNode5.geometry = SCNCylinder(radius: 0.2, height: 0.08)
            CoinNode5.physicsBody = SCNPhysicsBody(type: .Dynamic, shape: SCNPhysicsShape(geometry: CoinNode5.geometry!, options: nil))
            
            CoinNode5.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 0.6, z: 0.6, duration: 1.0)))
            let CoinMaterial5 = SCNMaterial()
            CoinMaterial5.diffuse.contents = UIColor.yellowColor()
            CoinNode5.geometry!.materials = [CoinMaterial5]
            node.addChildNode(CoinNode5)
            CoinNode5.position = SCNVector3(x:18,y:2,z:Float(layer5))
            
            
        }
        
        for index in 0..<CoinsLayer6.count{
            let layer6 = CGFloat(CoinsLayer6[index])
            
            
            let CoinNode6 = SCNNode()
            CoinNode6.geometry = SCNCylinder(radius: 0.2, height: 0.08)
            CoinNode6.physicsBody = SCNPhysicsBody(type: .Dynamic, shape: SCNPhysicsShape(geometry: CoinNode6.geometry!, options: nil))
            
            CoinNode6.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 0.6, z: 0.6, duration: 1.0)))
            let CoinMaterial4 = SCNMaterial()
            CoinMaterial4.diffuse.contents = UIColor.yellowColor()
            CoinNode6.geometry!.materials = [CoinMaterial4]
            node.addChildNode(CoinNode6)
            CoinNode6.position = SCNVector3(x:30,y:2,z:Float(layer6))
            
            
        }
        
        for index in 0..<CoinsLayer7.count{
            let layer7 = CGFloat(CoinsLayer7[index])
            
            
            let CoinNode7 = SCNNode()
            CoinNode7.geometry = SCNCylinder(radius: 0.2, height: 0.08)
            CoinNode7.physicsBody = SCNPhysicsBody(type: .Dynamic, shape: SCNPhysicsShape(geometry: CoinNode7.geometry!, options: nil))
            
            CoinNode7.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 0.6, z: 0.6, duration: 1.0)))
            let CoinMaterial4 = SCNMaterial()
            CoinMaterial4.diffuse.contents = UIColor.yellowColor()
            CoinNode7.geometry!.materials = [CoinMaterial4]
            node.addChildNode(CoinNode7)
            CoinNode7.position = SCNVector3(x:18,y:2,z:Float(layer7))
            
            
        }
        
        for index in 0..<CoinsLayer8.count{
            let layer8 = CGFloat(CoinsLayer8[index])
            
            
            let CoinNode8 = SCNNode()
            CoinNode8.geometry = SCNCylinder(radius: 0.2, height: 0.08)
            CoinNode8.physicsBody = SCNPhysicsBody(type: .Dynamic, shape: SCNPhysicsShape(geometry: CoinNode8.geometry!, options: nil))
            
            CoinNode8.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 0.6, z: 0.6, duration: 1.0)))
            let CoinMaterial4 = SCNMaterial()
            CoinMaterial4.diffuse.contents = UIColor.yellowColor()
            CoinNode8.geometry!.materials = [CoinMaterial4]
            node.addChildNode(CoinNode8)
            CoinNode8.position = SCNVector3(x:3,y:2,z:Float(layer8))
            
            
        }
        
        
        
    }
    
}
