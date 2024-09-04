//
//  Elements.swift
//  GAA Score
//
//  Created by Harry Dart-O'Flynn on 11/02/2016.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//

import UIKit

class UI {


	static func addAGradientLayer(vc:UIViewController){
	
		let gradientLayer = CAGradientLayer()
		
		gradientLayer.frame = vc.view.bounds
 
		let color1 = UIColor(red: 0.0, green: 0.4, blue: 0.0, alpha: 1.0).CGColor as CGColorRef
		let color2 = UIColor(red: 0.0, green: 0.8, blue: 0, alpha: 1.0).CGColor as CGColorRef
		
		gradientLayer.colors = [color1, color2]
		gradientLayer.locations = [0.0, 1.0]
		
		vc.view.layer.addSublayer(gradientLayer)
		
		gradientLayer.zPosition = -1

	}

	static func createAPanel(vc:UIViewController, x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat)->UIView{
		let size = vc.view.bounds
		let vw = UIView(frame: CGRectMake(0,0,size.width * w,size.height * h))
		vw.center = CGPoint(x: size.width * x, y: size.height * y)
		vw.backgroundColor = UIColor(red: 0.2, green: 0.4, blue: 0.2, alpha: 1.0)
		vc.view.addSubview(vw)
		
		return vw
		
	}

	static func createATextfield(vc:UIViewController, x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat,fntSize:CGFloat)->UITextField{
		let size = vc.view.bounds
		let tf = UITextField(frame: CGRectMake(0,0,size.width * w,size.height * h * 0.8))
		tf.center = CGPoint(x: size.width * x, y: size.height * y)
		tf.borderStyle = UITextBorderStyle.RoundedRect
		tf.backgroundColor = UIColor.whiteColor()
		tf.textAlignment = .Center
		tf.returnKeyType = .Done
		var usedFntSize = fntSize
		if size.height > 600{
			usedFntSize = fntSize * 1.2
		}
		tf.font = UIFont(name: "Helvetica Bold", size: usedFntSize)
		vc.view.addSubview(tf)
		
		
		
		return tf
	}

	static func createABtn(vc:UIViewController, x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat,btnTitle:String,fntSize:CGFloat,bg:Int)->UIButton{
		let size = vc.view.bounds
		let image1 = UIImage(named: "button.png")
		let image2 = UIImage(named: "comms.png")
		let btn = UIButton(frame: CGRectMake(0,0,size.width * w,size.height * h))
		btn.center = CGPoint(x: size.width * x, y: size.height * y)
		btn.setTitle(btnTitle, forState: .Normal)
		btn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
		btn.setTitleShadowColor(UIColor.clearColor(), forState: .Highlighted)
		btn.titleLabel?.shadowOffset = CGSize(width: 3.0,height: 3.0)
		//btn.titleLabel?.font = UIFont.boldSystemFontOfSize(fntSize)
		//print(size)
		var usedFntSize = fntSize
		if size.height > 600{
			usedFntSize = fntSize * 1.2
		}
		btn.titleLabel?.font = UIFont(name: "Helvetica Bold", size: usedFntSize)
		switch bg {
			case 1:
				btn.setBackgroundImage(image1, forState: .Normal)
			
			case 2:
				btn.setBackgroundImage(image2, forState: .Normal)
			
			default:
				break
		}
		vc.view.addSubview(btn)
		return btn
		
	}
	
	static func createALbl(vc:UIViewController,x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat,lblTitle:String,fntSize:CGFloat)->UILabel{
		let size = vc.view.bounds
		let lbl = UILabel(frame: CGRectMake(0,0,size.width * w,size.height * h))
		lbl.text = lblTitle
		lbl.textAlignment = NSTextAlignment.Center
		lbl.center = CGPoint(x: size.width * x, y: size.height * y)
		lbl.textColor = UIColor.whiteColor()
		lbl.shadowColor = UIColor.blackColor()
		lbl.shadowOffset = CGSize(width: 3.0,height: 3.0)
		//lbl.font = UIFont.boldSystemFontOfSize(fntSize)
		var usedFntSize = fntSize
		if size.height > 600{
			usedFntSize = fntSize * 1.2
		}
		lbl.font = UIFont(name: "Helvetica Bold", size: usedFntSize)
		//lbl.backgroundColor = UIColor.blueColor()
		
		vc.view.addSubview(lbl)
		
		return lbl
	}
}

extension UILabel {
	func blink() {
			UIView.animateWithDuration(0.3, delay:0.0, options:[.Repeat,.Autoreverse], animations: {
			self.alpha = 0
			}, completion: nil)
			NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(self.stopBlink), userInfo: nil, repeats: false)
		
	}
	func stopBlink() {
		layer.removeAllAnimations()
		alpha = 1.0
	}
}