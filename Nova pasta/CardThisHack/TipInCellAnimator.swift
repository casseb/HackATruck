//
//  TipInCellAnimator.swift
//
//  Created by Helio Ribeiro da Cruz on 12/13/15.
//

import UIKit

import QuartzCore // 1

class TipInCellAnimator {
    // placeholder for things to come -- only fades in for now
    class func animate(cell:UITableViewCell) {
        
        let view = cell.contentView
        view.layer.opacity = 0.1
        UIView.animateWithDuration(2.0) {
            view.layer.opacity = 1
        }
    }
    
    class func animateWithRotation(cell:UITableViewCell) {
        let view = cell.contentView
        let rotationDegrees: CGFloat = 10
        let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
        //let offset = CGPointMake(-20, -20)
        let offset = CGPointMake(720, -20)
        var startTransform = CATransform3DIdentity // 2
        startTransform = CATransform3DRotate(CATransform3DIdentity,
            rotationRadians, 0.0, 0.0, 1.0) // 3
        startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0) // 4
        
        // 5
        view.layer.transform = startTransform
        view.layer.opacity = 0.8
        
        // 6
        UIView.animateWithDuration(0.6) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
    
    class func animateLeft(cell:UITableViewCell) {
        let view = cell.contentView
        let rotationDegrees: CGFloat = -10
        let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
        let offset = CGPointMake(-250, 0)
        var startTransform = CATransform3DIdentity // 2
        startTransform = CATransform3DRotate(CATransform3DIdentity,
            rotationRadians, 0.0, 0.0, 1.0) // 3
        startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0) // 4
        
        // 5
        view.layer.transform = startTransform
        view.layer.opacity = 0.8
        
        // 6
        UIView.animateWithDuration(0.6) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }

    
    class func animateForLeft(cell:UITableViewCell) {
        let view = cell.contentView
        let offset = CGPointMake(0, -20)
        //let offset = CGPointMake(0,0)
        var startTransform = CATransform3DIdentity
        startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0) // 4
        
        // 5
        //view.layer.opacity = 0.8
        
        // 6
        UIView.animateWithDuration(0.4) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
    
    class func animateWithFlip(cell:UITableViewCell) {
        let view = cell.contentView
        //let rotationDegrees: CGFloat = 150
        //let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
        //let offset = CGPointMake(-20, -20)
        //let offset = CGPointMake(0,0)
        var startTransform = CATransform3DIdentity // 2
        startTransform = CATransform3DScale(CATransform3DMakeRotation(0, 0, 0, 0),
            1, -1, 1) // 3
        //startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0) // 4
        
        // 5
        view.layer.transform = startTransform
        //view.layer.opacity = 0.8
        
        // 6
        UIView.animateWithDuration(0.4) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }
    
}
