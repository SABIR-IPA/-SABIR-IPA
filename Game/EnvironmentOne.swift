//
//  EnvironmentOne.swift
//  Game
//
//  Created by Harry Dart-O'Flynn on 30/05/2016.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//

import SceneKit

class EnvironmentOne: SCNNode {

	convenience init(create: Bool) {
		self.init()
		
		let floorGeo = SCNFloor()
		floorGeo.firstMaterial?.diffuse.contents = UIColor.init(red: 0.3, green: 0.5, blue: 0.3, alpha: 1.0)
		let floorNode = SCNNode(geometry: floorGeo)
		
		floorNode.physicsBody = SCNPhysicsBody(type: SCNPhysicsBodyType.Static,
		                                       shape: SCNPhysicsShape(geometry: floorGeo, options: nil))
		addChildNode(floorNode)
		
		let boxGeom = SCNBox(width: 2, height: 2, length: 20, chamferRadius: 0.2)
		boxGeom.firstMaterial?.diffuse.contents = UIColor.redColor()
		let boxNode = SCNNode(geometry:boxGeom)
		addChildNode(boxNode)
		boxNode.position = SCNVector3(x: -10, y: 1, z: 0)
		boxNode.physicsBody = SCNPhysicsBody.staticBody()
		
		let boxGeom1 = SCNBox(width: 2, height: 2, length: 20, chamferRadius: 0.2)
		boxGeom1.firstMaterial?.diffuse.contents = UIColor.blueColor()
		let boxNode1 = SCNNode(geometry:boxGeom1)
		addChildNode(boxNode1)
		boxNode1.position = SCNVector3(x: 10, y: 1, z: 0)
		boxNode1.physicsBody = SCNPhysicsBody.staticBody()
		
		let boxGeom2 = SCNBox(width: 20, height: 2, length: 2, chamferRadius: 0.2)
		boxGeom2.firstMaterial?.diffuse.contents = UIColor.yellowColor()
		let boxNode2 = SCNNode(geometry:boxGeom2)
		addChildNode(boxNode2)
		boxNode2.position = SCNVector3(x: -11, y: 1, z: -10)
		boxNode2.physicsBody = SCNPhysicsBody.staticBody()
		
		let boxGeom3 = SCNBox(width: 20, height: 2, length: 2, chamferRadius: 0.2)
		boxGeom3.firstMaterial?.diffuse.contents = UIColor.greenColor()
		let boxNode3 = SCNNode(geometry:boxGeom3)
		addChildNode(boxNode3)
		boxNode3.position = SCNVector3(x: 11, y: 1, z: -10)
		boxNode3.physicsBody = SCNPhysicsBody.staticBody()
		
	}

}
