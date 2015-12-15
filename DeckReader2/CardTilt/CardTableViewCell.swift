//
//  CardTableViewCell.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Edited by Ray Fix on 4/12/15.
//  Copyright (c) 2014-2015 Razeware LLC. All rights reserved.
//


import UIKit
import QuartzCore

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var aboutLabel: UILabel!
    @IBOutlet var profilePictureView: UIImageView!
    @IBOutlet var webLabel: UILabel!
    @IBOutlet var webButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var twitterImage: UIImageView!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var facebookImage: UIImageView!
    
    @IBOutlet var namePanel: UIView!
    
    var twitter:String?
    var facebook:String?
    
    
    func useMember(member:Member) {
        // Round those corners
        mainView.layer.cornerRadius = 10;
        mainView.layer.masksToBounds = true;
        
        // Fill in the data
        nameLabel.text = member.name
        aboutLabel.text = member.about
        
        //aboutLabel.hidden = true
        namePanel.hidden = false
        nameLabel.hidden = false
        
        
        // Fill the buttons and show or hide them
        webLabel.text = member.web
        
        
        //Swipe movement animation
        let aSwipeGesture = UISwipeGestureRecognizer(target:self, action:"swipeGesture:")
        aSwipeGesture.direction = .Down
        self.addGestureRecognizer(aSwipeGesture)
       // mainView.addGestureRecognizer(aSwipeGesture)
        
        
        
    }
    func swipeGesture(sender:UISwipeGestureRecognizer) {
        
        if sender.direction == .Down {
            TipInCellAnimator.animate(self)
            aboutLabel.hidden = false
            titleLabel.hidden = true
            locationLabel.hidden = true
            profilePictureView.hidden = true
            
            namePanel.hidden = true
            nameLabel.hidden = true
            
        }
    }
    
    
    func jumpTo(URLString:String?) {
        if let URL = NSURL(string: URLString!) {
            UIApplication.sharedApplication().openURL(URL)
        }
    }
    
    @IBAction func webButtonTapped(sender: AnyObject) {
        jumpTo(webLabel.text)
    }
    
    @IBAction func twitterButtonTapped(sender: AnyObject) {
        jumpTo(twitter)
    }
    
    @IBAction func facebookButtonTapped(sender: AnyObject) {
        jumpTo(facebook)
    }
}
