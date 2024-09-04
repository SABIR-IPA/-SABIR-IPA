//
//  AppHelper.swift
//  Game
//
//  Created by Muhammad Sabir on 8/7/16.
//  Copyright © 2016 Harry Dart-O'Flynn. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import QuartzCore
class AppHelper{

    static func showActivityIndicator(view: UIView, withOpaqueOverlay: Bool) {
        
        // this will be the alignment view for the activity indicator
        var superView: UIView = view
        
        // if we want an opaque overlay, do that work first then put the activity indicator within that view; else just use the passed UIView to center it
        if withOpaqueOverlay {
            let overlay = UIView()
            overlay.frame = CGRectMake(0.0, 0.0, view.frame.width, view.frame.height)
            overlay.layer.backgroundColor = UIColor.blackColor().CGColor
            overlay.alpha = 0.7
         //   overlay.tag = activityIndicatorOverlayViewTag
            
            overlay.center = superView.center
            overlay.hidden = false
            superView.addSubview(overlay)
            superView.bringSubviewToFront(overlay)
            
            // now we'll work on adding the indicator to the overlay (now superView)
            superView = overlay
        }
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        
        indicator.center = superView.center
       // indicator.tag = activityIndicatorViewTag
        indicator.hidden = false
        
        superView.addSubview(indicator)
        superView.bringSubviewToFront(indicator)
        
        indicator.startAnimating()
        
        // also indicate network activity in the status bar
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    static func hideActivityIndicator(view: UIView) {
        
        // stop the network activity animation in the status bar
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        // remove the activity indicator and optional overlay views
     //   view.viewWithTag(activityIndicatorViewTag)?.removeFromSuperview()
      //  view.viewWithTag(activityIndicatorOverlayViewTag)?.removeFromSuperview()
    }





}