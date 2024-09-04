//
//  Hardels.swift
//  Game
//
//  Created by Muhammad Sabir on 8/15/16.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//

import Foundation
import SceneKit

class Hardels
{
 
  
    var node = SCNNode()
    var wireNode = SCNNode()
    var wireScene = SCNScene()
    var bladScene = SCNScene()
    var bladeNode = SCNNode()
    var woodScene = SCNScene()
    var woodNode = SCNNode()
    var rakeScene = SCNScene()
    var rakeNode = SCNNode()
    var bowScene = SCNScene()
    var bowNode = SCNNode()
    var wallScene = SCNScene()
    var wallNode = SCNNode()
    var bombScene = SCNScene()
    var bombNode = SCNNode()
    var rollerScene = SCNScene()
    var rollerNode = SCNNode()
    var boardScene = SCNScene()
    var boardNode = SCNNode()
    var waterScene = SCNScene()
    var waterNode = SCNNode()
    var fenceScene = SCNScene()
    var fenceNode = SCNNode()
    var rampScene = SCNScene()
    var rampNode = SCNNode()
    
    init(){
        
        woodScene = SCNScene(named: "game.scnassets/Fence/fenceFinal.dae")!
        
        woodNode = woodScene.rootNode.childNodeWithName("FENCE", recursively: true)!
        node.addChildNode(woodNode)
        woodNode.position = SCNVector3(x:0,y:1,z:-15)
        woodNode.eulerAngles = SCNVector3(x:0,y:Float(M_PI/2),z:0)
        let Material = SCNMaterial()
        Material.diffuse.contents = "game.scnassets/Textures/Wood_Cherry_Original.jpg"
        woodNode.geometry!.materials = [Material]
        node.addChildNode(woodNode)
        bladScene = SCNScene(named: "game.scnassets/newsample/axe/WARHAMME POWERAXE.dae")!
        bladeNode = bladScene.rootNode.childNodeWithName("Cube", recursively: true)!
        node.addChildNode(bladeNode)
        bladeNode.position = SCNVector3(x:20,y:-0.5,z:-30)
        bladeNode.eulerAngles = SCNVector3(x:Float(M_PI/2),y:0,z:Float(M_PI/2))
        let Material1 = SCNMaterial()
        Material1.diffuse.contents = "game.scnassets/Textures/Wood_Cherry_Original.jpg"
        bladeNode.geometry!.materials = [Material1]
        node.addChildNode(bladeNode)
        bladeNode.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0.0, y: 1.0, z: 0.0, duration: 1.0)))
        
        //Pendulum
        rakeScene = SCNScene(named:"game.scnassets/newsample/sw/cuter.dae")!
        
        rakeNode = rakeScene.rootNode.childNodeWithName("rake", recursively: true)!
        node.addChildNode(rakeNode)
        rakeNode.position = SCNVector3(x:0,y:2,z:-15)
        let moveUp = SCNAction.moveByX(0, y: 3, z: 0, duration: 1)
        moveUp.timingMode = SCNActionTimingMode.EaseInEaseOut;
        let moveDown = SCNAction.moveByX(0, y: -3, z: 0, duration: 1)
        moveDown.timingMode = SCNActionTimingMode.EaseInEaseOut;
        let moveSequence = SCNAction.sequence([moveUp,moveDown])
        let moveLoop = SCNAction.repeatActionForever(moveSequence)
        rakeNode.runAction(moveLoop)
        //Bow
        bowScene = SCNScene(named:"game.scnassets/newsample/bow/bow.dae")!
        
        bowNode = bowScene.rootNode.childNodeWithName("Cube", recursively: true)!
        bowNode.position = SCNVector3(x:0,y:1,z:-13)
        let Material2 = SCNMaterial()
        Material2.diffuse.contents = "game.scnassets/Textures/Wood_Cherry_Original.jpg"
        bowNode.geometry!.materials = [Material2]
        node.addChildNode(bowNode)
        //Walls
        wallScene = SCNScene(named:"game.scnassets/newsample/block/warzone.dae")!
        
        wallNode = wallScene.rootNode.childNodeWithName("Cube", recursively: true)!
        wallNode.position = SCNVector3(x:0,y:1,z:-13)
        let Material3 = SCNMaterial()
        Material3.diffuse.contents = UIColor.yellowColor()
        wallNode.geometry!.materials = [Material3]
        node.addChildNode(wallNode)
        //bomb
        bombScene = SCNScene(named:"game.scnassets/newsample/Bomb_dae/Bomb.dae")!
        
        bombNode = bombScene.rootNode.childNodeWithName("Bomb", recursively: true)!
        bombNode.position = SCNVector3(x:0,y:1,z:-8)
        let Material4 = SCNMaterial()
        Material4.diffuse.contents = UIColor.blueColor()
        bombNode.geometry!.materials = [Material4]
        node.addChildNode(bombNode)
        //Rollers
        
        rollerScene = SCNScene(named:"game.scnassets/samples/circles.dae")!
        
        rollerNode = rollerScene.rootNode.childNodeWithName("instance_1", recursively: true)!
        var rollerNode2 = SCNNode()
        rollerNode2 = rollerScene.rootNode.childNodeWithName("instance_2", recursively: true)!
        rollerNode.position = SCNVector3(x:0,y:0,z:-8)
        rollerNode2.position = SCNVector3(x:-2,y:0,z:-8)
        node.addChildNode(rollerNode)
        node.addChildNode(rollerNode2)
        //Board
        
        //        boardScene = SCNScene(named:"game.scnassets/samples/board.dae")!
        //
        //        boardNode = boardScene.rootNode.childNodeWithName("group_0", recursively: true)!
        //        boardNode.position = SCNVector3(x:0,y:1,z:-36)
        //        node.addChildNode(boardNode)
        //
        //
        
        //water fall
        waterScene = SCNScene(named:"game.scnassets/Hurdles/samples/water.dae")!
        
        waterNode = waterScene.rootNode.childNodeWithName("ID1285", recursively: true)!
        waterNode.position = SCNVector3(x:0,y:1,z:-9)
        node.addChildNode(waterNode)
        
        // wire fence
        wireScene = SCNScene(named:"game.scnassets/Hurdles/Collada/75659_Barbed_wire_fence/barbed wire.dae")!
        wireNode = wireScene.rootNode.childNodeWithName("Circle", recursively: true)!
        wireNode.position = SCNVector3(x:0,y:1,z:-9)
        node.addChildNode(wireNode)
        //Fence
        fenceScene = SCNScene(named:"game.scnassets/Hurdles/Collada/66818_picket_fence/fence.dae")!
        fenceNode = fenceScene.rootNode.childNodeWithName("Cube_002", recursively: true)!
        fenceNode.position = SCNVector3(x:0,y:1,z:-9)
        node.addChildNode(fenceNode)
        var secondNode = SCNNode()
        secondNode = fenceScene.rootNode.childNodeWithName("Cube_003", recursively: true)!
        fenceNode.position = SCNVector3(x:0,y:1,z:-9)
        node.addChildNode(secondNode)
        rampScene = SCNScene(named:"game.scnassets/Hurdles/Collada/63585_Damaged_concrete_barrier__Poly_count_in_desc__4/Damaged Concreate Barrier-With Normal map.dae")!
        rampNode = rampScene.rootNode.childNodeWithName("Cube_000", recursively: true)!
        rampNode.position = SCNVector3(x:0,y:1,z:-20)
        node.addChildNode(rampNode)
        var rampNode1 = SCNNode()
        var rampNode2 = SCNNode()
        rampNode1 = rampScene.rootNode.childNodeWithName("Cube_001", recursively: true)!
        rampNode1.position = SCNVector3(x:0,y:1,z:-20)
        node.addChildNode(rampNode1)
        rampNode2 = rampScene.rootNode.childNodeWithName("Cube_002", recursively: true)!
        rampNode2.position = SCNVector3(x:0,y:1,z:-20)
        node.addChildNode(rampNode2)
        
        
        
        
        
        
        
    }

}