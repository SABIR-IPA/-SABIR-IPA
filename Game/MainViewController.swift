//
//  ViewController.swift
//  Game
//
//  Created by Harry Dart-O'Flynn on 25/05/2016.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//


import UIKit
import SceneKit
import QuartzCore
class MainViewController: UIViewController {

  //  @IBOutlet weak var simpleProgress: UIProgressView!
  //  @IBOutlet weak var simpleLabel: UILabel!
  //  var current: Int = 0
   
    var progressView: UIProgressView?
    var progressView2: UIProgressView?
    var progressLabel: UILabel?
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    var timer: NSTimer!
    var p:Double = 10.0
    var p1:Double = 10.0
    var timer1: NSTimer!
	override func viewDidLoad() {
		super.viewDidLoad()
		//UI.addAGradientLayer(self)
        //let yourImage = UIImage(named: "SomaPC14.jpg")
       // let imageview = UIImageView(image: yourImage)
      //  self.view.addSubview(imageview)
       
     
        let background = UIImage(named: "image1.jpg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
 
       
    
		//UI.createAPanel(self, x: 0.5, y: 0.5, w: 0.6, h: 0.6)
      //  UI.font = UIFont(name: "QuicksandDash-Regular", size: 35)
        let label = UI.createALbl(self, x: 0.5, y: 0.3, w: 0.5, h: 0.1, lblTitle: "SURVIVAL RUN" ,fntSize: 45)
        UILabel.appearance().font = UIFont(name: "YouMurdererBB", size: 55)
      //  label.setTitleColor(UIColor.redColor(), forState: .Normal)
        
       // label.textColor = UIColor.darkredColor()
        label.textColor = UIColor(red: 178, green: 50, blue: 50, alpha: 1.0)
       // label.shadowColor = UIColor.redColor()
		let button1 = UI.createABtn(self, x: 0.5, y: 0.5, w: 0.5, h: 0.1, btnTitle: "Level One", fntSize: 30, bg: 1)
        
        button1.titleLabel!.font =  UIFont(name: "YouMurdererBB", size: 35)
       // button1.titleLabel!.textColor = UIColor.blueColor()
        
        button1.setTitleColor(UIColor.redColor(), forState: .Normal)
		button1.addTarget(self, action: #selector(MainViewController.addControls), forControlEvents: .TouchUpInside)
      //  updator()
		button1.tag = 1
		let button2 = UI.createABtn(self, x: 0.5, y: 0.6, w: 0.5, h: 0.1, btnTitle: "Level Two", fntSize: 30, bg: 1)
        button2.titleLabel!.font =  UIFont(name: "YouMurdererBB", size: 35)
        button2.setTitleColor(UIColor.redColor(), forState: .Normal)
   //     UIButton.appearance().font = UIFont(name: "YouMurdererBB", size: 35)
		button2.addTarget(self, action: #selector(MainViewController.addControls2), forControlEvents: .TouchUpInside)
		button2.tag = 2
		let button0 = UI.createABtn(self, x: 0.5, y: 0.7, w: 0.5, h: 0.1, btnTitle: "Intro Video", fntSize: 30, bg: 1)
        button0.titleLabel!.font =  UIFont(name: "YouMurdererBB", size: 35)
        button0.setTitleColor(UIColor.redColor(), forState: .Normal)
		button0.addTarget(self, action: #selector(self.switchToLevelScreen(_:)), forControlEvents: .TouchUpInside)
		button0.tag = 0
	}
	
    
	
	func switchToLevelScreen(sender:AnyObject){
		/*
        let lbl = UI.createALbl(self, x: 0.5, y: 0.9, w: 0.9, h: 0.1, lblTitle: "Loading", fntSize: 40)
			lbl.blink()
       // UI.createAPro
        */
			var sgLbl = String()
		switch sender.tag {
		case 1:
            // addControls()
            // updator()
			sgLbl = "gotoLevel1Segue"
            
            break;
		case 2:
			sgLbl = "gotoLevel2Segue"
            break;
		
        default:
			sgLbl = "menuToVidSegue"
		}
		self.performSegueWithIdentifier(sgLbl, sender: nil)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

   
    func updator()
    {
    timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(MainViewController.UPDATE), userInfo: nil, repeats: true)
        timer.fire()
    }
    func UPDATE() {
      //  while (p <= 100.0){
    progressView?.progress = (Float)(p/100.0)
        p = p + 10.0
        if p == 100 {
        switchToLevelScreen(progressView!)
            
        }
     //   }
    }
    //MARK:- Controls
    func addControls() {
        // Create Progress View Control
        progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
        progressView!.tag = 1
        progressView?.frame = CGRectMake(180, 280, 250, 2);
        progressView?.trackTintColor = UIColor.blueColor()
        progressView?.progressTintColor = UIColor.redColor()
    //    progressView?.center = CGPointMake(320.0, 480.0)
    //    progressView?.center = self.view.center
        view.addSubview(progressView!)
        
        // Add Label
        progressLabel = UILabel()
        let frame = CGRectMake(view.center.x - 25, view.center.y - 100, 100, 50)
        progressLabel?.frame = frame
        view.addSubview(progressLabel!)
     
        updator()
            }
    
    func updator2()
    {
        timer1 = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(MainViewController.UPDATE2), userInfo: nil, repeats: true)
        timer1.fire()
    }
    func UPDATE2() {
       
        progressView2?.progress = (Float)(p1/10.0)
        p1 = p1 + 1.0
        if p1 == 10 {
            switchToLevelScreen(progressView2!)
            
        }
      
    }
    func addControls2() {
        // Create Progress View Control
        progressView2 = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
        progressView2!.tag = 2
        //  ProgressView?.trackTintColor = UIColor.brownColor()
        //   progressView?.center = CGPointMake(0.0, 0.0);// for topleft
        
        // progressView?.center = CGPointMake(160.0, 240.0);// for center
        
        progressView2?.frame = CGRectMake(180, 280, 250, 2);
        progressView2?.trackTintColor = UIColor.blueColor()
        progressView2?.progressTintColor = UIColor.redColor()
        //    progressView?.center = CGPointMake(320.0, 480.0)
        //    progressView?.center = self.view.center
        view.addSubview(progressView2!)
        
        // Add Label
        progressLabel = UILabel()
        let frame = CGRectMake(view.center.x - 25, view.center.y - 100, 100, 50)
        progressLabel?.frame = frame
        view.addSubview(progressLabel!)
        
        updator2()
    }

}

