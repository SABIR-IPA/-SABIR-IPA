//
//  FirstScene.swift
//  Game
//
//  Created by Harry Dart-O'Flynn on 25/05/2016.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//
import UIKit
import SceneKit
import CoreMotion
let collisionHero:Int = 1 << 0
let collsionTarget:Int = 1 << 1
let collisionWall1:Int = 2<<1
let collisionWall2:Int = 3<<2
let collisionWall3:Int = 4<<3

let playerCategory: Int = 1
let floorCategory: Int = 2
func join(s1: String, s2: String, joiner: String) -> String
{
    return s1 + joiner + s2
}

func degToRad( deg : Float ) -> Float
{
    return ((deg) / 180.0 * Float(M_PI))
}


var sphereNode = SCNNode()
var boxNode = SCNNode()
var mountNode = SCNNode()
var TunnelNode = SCNNode()
var planeNode = SCNNode()
var rock1 = SCNNode()
var rock2 = SCNNode()
var rock3 = SCNNode()
var rock4 = SCNNode()
class FirstScene: SCNScene,SCNSceneRendererDelegate,SCNPhysicsContactDelegate  {

	var motionManager: CMMotionManager!
	var cameraNode = SCNNode()
	let emptyAtCenter = SCNNode()
    var scn = SCNScene()
     var scnView: SCNView!
	private let unrealCharacter = UnrealCharacter()
    let game = GameHelper.sharedInstance
    private let coins = particles()
    
    var notMoving = true
    
    var walkGesture = UIPanGestureRecognizer()
    var activeCollisionsBitMask: Int = 0
	var environs = EnvironmentOne(create:true)
    
    
	
//	convenience init(create: Bool) {
//		self.init()
   
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    init(currentview view: SCNView) {
        
        super.init()
        scnView = view
    setupHUD()
		motionManager = CMMotionManager()
		motionManager.startAccelerometerUpdates()
        
        
        scn = SCNScene(named: "game.scnassets/Update2/Tunnel-005.dae")!
        scn.rootNode.addChildNode(coins.node)
        
        
                /*
                rock1  = (scn.rootNode.childNodeWithName("ID38379", recursively: true))!
                rock1.physicsBody = SCNPhysicsBody.staticBody()
                rock1.physicsBody!.contactTestBitMask = 1
                //rock1.physicsBody?.contactTestBitMask = collisionWall1
                //rock1.physicsBody?.categoryBitMask = collisionHero
                rock2  = (scn.rootNode.childNodeWithName("ID38369", recursively: true))!
                rock2.physicsBody = SCNPhysicsBody.staticBody()
                rock2.physicsBody!.contactTestBitMask = 1
                //rock2.physicsBody?.contactTestBitMask =   collisionWall2
                //rock2.physicsBody?.categoryBitMask = collisionHero
                
 */
                rock3  = (scn.rootNode.childNodeWithName("ID79647", recursively: true))!
                rock3.physicsBody = SCNPhysicsBody.staticBody()
                //rock3.physicsBody?.contactTestBitMask =   collsionTarget
                //rock3.physicsBody?.categoryBitMask = collisionHero
                rock3.physicsBody!.contactTestBitMask = 1
                rock4  = (scn.rootNode.childNodeWithName("ID78487", recursively: true))!
                rock4.physicsBody = SCNPhysicsBody.staticBody()
                //rock3.physicsBody?.contactTestBitMask =   collisionHero
                //rock3.physicsBody?.categoryBitMask = collisionWall1
                rock4.physicsBody!.contactTestBitMask = 1
   //             scn.rootNode.addChildNode(rock1)
     //           scn.rootNode.addChildNode(rock2)
                scn.rootNode.addChildNode(rock3)
                scn.rootNode.addChildNode(rock4)
        
        
        scnView.scene = scn
        scnView.loops = true
        scnView.playing = true
        scnView.delegate = self
      //  scnView.backgroundColor = UIColor.blackColor()
         scnView.scene?.physicsWorld.contactDelegate = self
        scnView.allowsCameraControl = true
        // AppHelper.showActivityIndicator(scnView, withOpaqueOverlay: true)
        
        let part = SCNParticleSystem(named: "reactor", inDirectory: nil)!
        let particleNode = SCNNode()
        
        particleNode.addParticleSystem(part)
        //scnView.addChildNode(particleNode)
       //  mountNode.addChildNode(particleNode)
       // particleNode.position = SCNVector3(x: 0,y: 0,z: 24)
        scn.rootNode.addChildNode(particleNode)
        
        
        let boxGeom = SCNBox(width: 5, height:10, length: 5, chamferRadius: 0.8)
        boxGeom.firstMaterial?.diffuse.contents = UIColor.brownColor()
        boxNode = SCNNode(geometry:boxGeom)
        boxNode.physicsBody = SCNPhysicsBody.kinematicBody()
         boxNode.physicsBody?.contactTestBitMask = 1
//        boxNode.physicsBody?.contactTestBitMask = collisionHero | collsionTarget
//        boxNode.physicsBody?.categoryBitMask = collisionHero
//        boxNode.physicsBody?.collisionBitMask = collsionTarget
        
        
        
                 //////////////////////////////////////////////////////////////////////////////////////////
        mountNode.addChildNode(unrealCharacter.node)
        mountNode.addChildNode(boxNode)
        boxNode.opacity = CGFloat(0)
        scn.rootNode.addChildNode(mountNode)
//        
//        let plane = SCNPlane(width:20.0,height:20.0)
//        plane.firstMaterial?.diffuse.contents = UIColor.brownColor()
//        planeNode = SCNNode(geometry: plane)
//        planeNode.position = SCNVector3(4.0,1.0,-10.0)
//        // planeNode.eulerAngles = SCNVector3(x: Float(-M_PI/2), y:0, z: 0)
//        planeNode.physicsBody = SCNPhysicsBody.staticBody()
//        planeNode.opacity = CGFloat(0)
//        //planeNode.physicsBody?.contactTestBitMask = 1
//        planeNode.physicsBody = SCNPhysicsBody(type: SCNPhysicsBodyType.Static,
//                                               shape: SCNPhysicsShape(geometry: plane, options: nil))
//        planeNode.physicsBody?.allowsResting = true
//        let sphereGeometry = SCNSphere(radius: 1.0)
//        sphereNode = SCNNode(geometry: sphereGeometry)
//        sphereNode.position = SCNVector3Make(0, 10.0, -10)
//        sphereNode.name = "sphere"
//        // sphere physics
//        sphereNode.physicsBody = SCNPhysicsBody.dynamicBody()
//        sphereNode.physicsBody!.friction = 0.3
//        sphereNode.physicsBody!.restitution = 0.7
//        sphereNode.physicsBody!.mass = 0.5
//        sphereNode.physicsBody!.angularVelocity = SCNVector4(x: 5, y: 1, z: 1, w: 1)
//        let sphereMaterial = SCNMaterial()
//        sphereMaterial.diffuse.contents = UIColor.redColor()
//        sphereGeometry.materials = [sphereMaterial]
//        scn.rootNode.addChildNode(sphereNode)
        
        //mountNode.physicsBody = SCNPhysicsBody.staticBody()
        //mountNode.physicsBody?.contactTestBitMask = collisionHero | collsionTarget
        //mountNode.physicsBody?.categoryBitMask = collisionHero
        // mountNode.physicsBody?.collisionBitMask = collsionTarget
        //planeNode.physicsBody?.contactTestBitMask =   collsionTarget
        //planeNode.physicsBody?.categoryBitMask = collsionTarget
        //planeNode.physicsBody?.collisionBitMask = collisionHero
//        mountNode.physicsBody?.angularDamping = 0.9999999
//        mountNode.physicsBody?.damping = 0.9999999
//        mountNode.physicsBody?.friction = 0.0
//        mountNode.physicsBody?.restitution = 0.0
//        mountNode.physicsBody?.velocityFactor = SCNVector3(x: 1, y: 0, z: 1)
//        //mountNode.physicsBody?.categoryBitMask = playerCategory
//        mountNode.name = "Logan"
//        // planeNode.physicsBody?.categoryBitMask = floorCategory
//        planeNode.name = "plane"
//        
       // scn.rootNode.addChildNode(planeNode)
        let wallGeometry = SCNPlane(width: 1500, height: 12)
        wallGeometry.firstMaterial?.diffuse.contents = UIColor.redColor()
        let wallGNode = SCNNode(geometry: wallGeometry)
        wallGNode.position = SCNVector3(x:-14,y:-0,z:-8)
        wallGNode.eulerAngles = SCNVector3(x:0,y:Float(M_PI/2),z:0)
         wallGNode.opacity = CGFloat(0)
        scn.rootNode.addChildNode(wallGNode)
        
       
        // create and add a light to the scene
        // create and add a light to the scene
        let lightNodeDirnl = SCNNode()
        lightNodeDirnl.light = SCNLight()
        lightNodeDirnl.light!.type = SCNLightTypeDirectional
      //  lightNodeDirnl.position = SCNVector3(x: 0, y: 5, z: 5)
        lightNodeDirnl.light?.color = UIColor.darkGrayColor()
        var TunnelLight = SCNNode()
        TunnelLight = (scn.rootNode.childNodeWithName("ID3920", recursively: true))!
      //  lightNodeDirnl.constraints = [SCNLookAtConstraint(target: TunnelLight)]
      //  cameraNode.constraints = [SCNLookAtConstraint(target: TunnelLight)]
     //  TunnelLight.addChildNode(lightNodeDirnl)
  //      scn.rootNode.addChildNode(lightNodeDirnl)
       /*
        let lightNodeSpot = SCNNode()
        lightNodeSpot.light = SCNLight()
        lightNodeSpot.light?.type = SCNLightTypeSpot
        lightNodeSpot.castsShadow = true
        lightNodeSpot.position = SCNVector3(x: 0, y: 6, z: 5)
        var TunnelLight2 = SCNNode()
        TunnelLight2 = (scn.rootNode.childNodeWithName("ID4714", recursively: true))!
        lightNodeSpot.constraints = [SCNLookAtConstraint(target: TunnelLight2)]
        cameraNode.constraints = [SCNLookAtConstraint(target: TunnelLight2)]
        scn.rootNode.addChildNode(TunnelLight2)
 */
 /*
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni  // SCNLightTypeSpot
        lightNode.position = SCNVector3(x: 1, y: 10, z: -20)
        lightNode.light!.color = UIColor( white:1, alpha:1.0)
        lightNode.light!.castsShadow = true
        lightNode.light!.shadowColor = UIColor.blackColor()
        lightNode.light!.shadowRadius = 10.0
        scn.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.whiteColor()
        scn.rootNode.addChildNode(ambientLightNode)
        

        
        */
        //////////////----CAMERA----//////////////////////
        
        
        // create and add a camera to the scene
        cameraNode.camera = SCNCamera()
        
        //    stillCamera(self)
        //  scene.rootNode.addChildNode(cameraNode)
        cameraNode.camera?.zFar = 1400
        //   cameraNode.camera?.zNear = 2
        //    cameraNode.camera?.yFov = 400
        cameraNode.position = SCNVector3(x: 0, y: 28, z: 8)
        // cameraNode.eulerAngles = SCNVector3Make(0,Float(-M_PI/2), Float(-M_PI/2))
        
        // cameraNode.position = SCNVector3(x: 0, y: 20, z: 40)
        //        var cameraTransform = SCNMatrix4Identity
        //        cameraTransform = SCNMatrix4Rotate(cameraTransform, Float(M_PI_2), 0, 0,1)
        //        cameraTransform = SCNMatrix4Translate(cameraTransform, 2, 0, 0)
        //        cameraNode.transform = cameraTransform
        
        scnView.pointOfView = cameraNode
        // scene.background.contents = "art.scnassets/img_skybox"
        let coin = SCNNode()
        
        let cylinder = SCNCylinder(radius: 0.2, height: 0.09)
        cylinder.radialSegmentCount = 10
        
        coin.geometry = cylinder
        coin.position = SCNVector3( x: 0, y: 5, z: -3 )
        coin.rotation = SCNVector4( x: 0, y: 0, z: 1, w: degToRad(90))
        scn.rootNode.addChildNode(coin)
        
      //  var physBody = SCNPhysicsShape(geometry: coin.geometry!, options: nil)
        coin.physicsBody = SCNPhysicsBody.dynamicBody()
        coin.physicsBody!.mass = 5
        coin.physicsBody!.friction = 0.7
        coin.physicsBody!.restitution = 0.2
        coin.name = "Coin"
        
        // create and configure a material
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.yellowColor()
        material.locksAmbientWithDiffuse = true
        
        // set the material to the 3d object geometry
        coin.geometry!.firstMaterial = material
        var obstacle:SCNNode
        
                 //let yPosition:Float = (Float(arc4random_uniform(4)) * -1.0) + 2.0
        
        let vector = SCNVector3(x: 0, y: 3, z: -5)
        
        switch arc4random_uniform(1) {
        case 0:
            obstacle = coin.clone()
        
        default:
            obstacle = coin.clone()
        }
        
        obstacle.position = vector
        //obstacle.opacity = 0
        obstacle.name = "Obstacle"

        

        
                ///////////////////----END-CAMERA---///////////////
        //mountNode.addChildNode(cameraNode)
        unrealCharacter.idle()
        //   unrealCharacter.animate()
        //self.moveup()
        
        let startTap = UITapGestureRecognizer(target: self, action: #selector(FirstScene.handleStartTap(_:)))
        scnView.addGestureRecognizer(startTap)
        
        let stopTap = UITapGestureRecognizer(target: self, action: #selector(FirstScene.handleStopTap(_:)))
        scnView.addGestureRecognizer(stopTap)
        stopTap.numberOfTapsRequired = 2
		
	}
    /*
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	*/
	func renderer(renderer: SCNSceneRenderer, updateAtTime time: NSTimeInterval) {
			if let accelerometerData = motionManager.accelerometerData {
			physicsWorld.gravity = SCNVector3(accelerometerData.acceleration.y * -20,-10,(accelerometerData.acceleration.x + 0.5) * -5)
			
		}
	}
    
    func setupHUD() {
        game.hudNode.position = SCNVector3(x: 0.0, y: 10.0, z: 0.0)
        scn.rootNode.addChildNode(game.hudNode)
    }
//    func physicsWorld(world: SCNPhysicsWorld, didBeginContact contact: SCNPhysicsContact) {
//        print("contact")
//        //
//        //        if (contact.nodeA.name == "Logan" && contact.nodeB.name == "plane") {
//        //            print("player  hit plane")
//        //        }
//        let contactMask = contact.nodeA.physicsBody!.categoryBitMask |
//            contact.nodeB.physicsBody!.categoryBitMask
////        var contactNode:SCNNode!
////        if contact.nodeA.name == "Logan" {
////            contactNode = contact.nodeB
////        } else {
////            contactNode = contact.nodeA
////        }
//        
//        
//        if contactMask == collsionTarget | collisionHero   {
//            print("The Hero hit the target CL")
//            unrealCharacter.activateWalking(false)
//            mountNode.removeAllActions()
//        }
//        if contactMask == collisionWall1 | collisionHero   {
//            print("The Hero hit the target CR")
//            unrealCharacter.activateWalking(false)
//            mountNode.removeAllActions()
//        }
//        if contactMask == collisionWall2 | collisionHero   {
//            print("The Hero hit the target OL")
//            unrealCharacter.activateWalking(false)
//            mountNode.removeAllActions()
//        }
//        if contactMask == collisionWall3 | collisionHero   {
//            print("The Hero hit the target OR")
//            unrealCharacter.activateWalking(false)
//            mountNode.removeAllActions()
//        }
//
//
//        
//    }
    
    
    
    func physicsWorld(world: SCNPhysicsWorld, didBeginContact contact: SCNPhysicsContact) {
      /*
        if (contact.nodeA == rock1 || contact.nodeA == boxNode) && (contact.nodeB == rock1 || contact.nodeB == boxNode){
            print("contact CL")
            unrealCharacter.activateWalking(false)
            mountNode.removeAllActions()
        }
        if (contact.nodeA == rock2 || contact.nodeA == boxNode) && (contact.nodeB == rock2 || contact.nodeB == boxNode){
            print("contact CR ")
          unrealCharacter.activateWalking(false)
            mountNode.removeAllActions()
            
        }
        */
        if (contact.nodeA == rock3 || contact.nodeA == boxNode) && (contact.nodeB == rock3 || contact.nodeB == boxNode){
            print("contact OL ")
           unrealCharacter.activateWalking(false)
            mountNode.removeAllActions()
        }
        
        if (contact.nodeA == rock4 || contact.nodeA == boxNode) && (contact.nodeB == rock4 || contact.nodeB == boxNode){
            print("contact OR ")
           unrealCharacter.activateWalking(false)
            mountNode.removeAllActions()
        }
    }

    func handleStartTap(gestureRecognize: UIGestureRecognizer) {
       
 
 // retrieve the SCNView
       // let scnView = self.view as! SCNView
        let screen = scnView.frame.size
        let ctrPoint = CGPointMake(screen.width * 0.5,screen.height * 0.5)
        
        let p = gestureRecognize.locationInView(scnView)
        
        let displX = p.x - ctrPoint.x
        print(displX)
        let displY = p.y - ctrPoint.y
        print(displY)
        if (abs(displX) < -25) || (abs(displX) < 25){
            unrealCharacter.activateWalking(true)
            moveForward()
            followCamera(self)
          //  AppHelper.hideActivityIndicator(scnView)
       // AppHelper.showActivityIndicator(scnView, withOpaqueOverlay: false)
            
            //   overheadCamera(self)
        }else if !unrealCharacter.actionNotAdded{
        //    let angle = atan(displX/displY)
            
            if displX <= -10{
                //  let angl:CGFloat = 3.1
                print("Right")
                //  self.turnCharacter(angle)
              //  self.translate()
                self.turnLeft()
            }
            else{
                if displX >= 10 {
                    //self.turnCharacter(CGFloat(M_PI)+angle)
                    print("Left")
                    self.turnRight()
                   // self.moveup()
                }else{
                    print("problem")
                    //  self.turnCharacter(angle-CGFloat(M_PI))
                }
                
            }
            
 
 }
 
        
    }
    
 
    func handleStopTap(gestureRecognize: UIGestureRecognizer) {
        
        unrealCharacter.activateWalking(false)
        mountNode.removeAllActions()
        unrealCharacter.idle1()
        
        
    }
    
    var count = 1
    func moveForward(){
        /*
        if count == 1 {
            
            turnBack()
            count = count + 1
        }
        let rotAngle = CGFloat(mountNode.rotation.w)
        let dirn = updateForwardDirection(rotAngle)
        unrealCharacter.activateWalking(true)
        let walkAction = SCNAction.repeatActionForever(SCNAction.moveBy(dirn, duration: 0.2))
        mountNode.runAction(walkAction)
        
        */
        if count == 1 {
            self.moveup()
            turnBack()
            count = count + 1
        }
        else
        {
            let rotAngle = CGFloat(mountNode.rotation.w)
            let dirn = updateForwardDirection(rotAngle)
            unrealCharacter.activateWalking(true)
            let walkAction = SCNAction.repeatActionForever(SCNAction.moveBy(dirn, duration: 0.111111111111))
            mountNode.runAction(walkAction)
            
            
        }
    }
    /*
    func translate(){
        
         mountNode.removeAllActions()
         let moveRight = SCNAction.moveByX(10.0, y: 0.0, z: 0.0, duration: 1.0)
         mountNode.runAction(moveRight)
         
         let moveUp = SCNAction.moveByX(10.0, y: 10.0, z: 0.0, duration: 1.0)
         mountNode.runAction(moveUp)
         
        
        
        mountNode.removeAllActions()
        mountNode.runAction(SCNAction.sequence([
            SCNAction.moveByX(10.0, y: 0.0, z: 0.0, duration: 1.0),
            SCNAction.runBlock({void in self.moveForward()})
            ]))
        
    }
    */
    
    func turnRight(){
        /*
         mountNode.removeAllActions()
         let moveRight = SCNAction.moveByX(10.0, y: 0.0, z: 0.0, duration: 1.0)
         mountNode.runAction(moveRight)
         
         let moveUp = SCNAction.moveByX(10.0, y: 10.0, z: 0.0, duration: 1.0)
         mountNode.runAction(moveUp)
         
         */
        
        //    mountNode.removeAllActions()
        mountNode.runAction(SCNAction.sequence([
            SCNAction.moveByX(18.0, y: 0.0, z: 0.0, duration: 1.0),
            SCNAction.runBlock({void in self.moveForward()})
            ]))
        
    }
    
    func turnLeft(){
        /*
         mountNode.removeAllActions()
         let moveRight = SCNAction.moveByX(10.0, y: 0.0, z: 0.0, duration: 1.0)
         mountNode.runAction(moveRight)
         
         let moveUp = SCNAction.moveByX(10.0, y: 10.0, z: 0.0, duration: 1.0)
         mountNode.runAction(moveUp)
         
         */
        
        //  mountNode.removeAllActions()
        mountNode.runAction(SCNAction.sequence([
            SCNAction.moveByX(-18.0, y: 0.0, z: 0.0, duration: 1.0),
            SCNAction.runBlock({void in self.moveForward()})
            ]))
        
    }
    
    
    func moveup(){
        
        mountNode.removeAllActions()
        let moveRight = SCNAction.moveByX(0.0, y: 10.0, z: 0.0, duration: 1.0)
        mountNode.runAction(moveRight)
        
    }
    
    func turnBack(){
        let ang:CGFloat = 3.1
        print(ang)
        turnCharacter(ang)
    }
    
    func turnCharacter(angle:CGFloat) {
        unrealCharacter.activateWalking(false)
        let currentAngle = CGFloat(mountNode.rotation.w)
        let newAngle = currentAngle + angle
        
        mountNode.removeAllActions()
        mountNode.runAction(SCNAction.sequence([
            SCNAction.rotateToAxisAngle(SCNVector4(0,1,0,newAngle), duration: 0.3),
            SCNAction.runBlock({void in self.moveForward()})
            ]))
    }
    
    ////
    
    func updateForwardDirection(rotAngle:CGFloat)->SCNVector3{
        
        let xCord =  sin(rotAngle)
        let zCord =  cos(rotAngle)
        
        return  SCNVector3(xCord,0,zCord)
        
    }
  
    //////////////FOLLOW CAMERA./////////////////
    func followCamera(sender:AnyObject){
        
        // self.moveup()
        ///////////////////
        mountNode.addChildNode(cameraNode)
        cameraNode.rotation = SCNVector4(0,1,0,M_PI)
      
        cameraNode.position = SCNVector3(x: 0, y: 28, z: -8)
        
    }
    
    /////////////////E=N=D///////////////////
    

	
}