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
    
    var alternar = true
    
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
    @IBOutlet weak var conteudo: UILabel!
    
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
        
        //Swipe movement animation
        let aSwipeGesture2 = UISwipeGestureRecognizer(target:self, action:"swipeGesture:")
        aSwipeGesture2.direction = .Up
        self.addGestureRecognizer(aSwipeGesture2)
        // mainView.addGestureRecognizer(aSwipeGesture)

        
        
        
    }
    

    
    func swipeGesture(sender:UISwipeGestureRecognizer) {
        
        let conteudoText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas turpis ex, porta non fringilla sit amet, egestas in est. Quisque eget sem ut eros auctor tempus id ut orci. Maecenas faucibus vehicula arcu, vitae dictum metus sodales lacinia. Etiam ultricies posuere ipsum in malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cursus, augue tempus vulputate posuere, lorem arcu rhoncus nisl, eget congue quam massa non orci. Fusce sed odio ante. Cras a sapien ut nunc bibendum imperdiet. Ut semper feugiat ligula, ac tempor elit auctor id. Mauris semper sodales mi at molestie. Pellentesque lacinia mi vel massa finibus, ac ultricies justo vehicula. Cras tortor eros, gravida ac vulputate sed, pellentesque luctus quam. Nullam tincidunt fermentum vehicula."
        
        if (sender.direction == .Down || sender.direction == .Up) {
            
            if alternar == true{
                TipInCellAnimator.animateWithFlip(self)
                aboutLabel.hidden = true
                namePanel.hidden = true
                nameLabel.hidden = true
                alternar = false
                conteudo.hidden = false
                conteudo.text = conteudoText
            }else{
                TipInCellAnimator.animateWithFlip(self)
                aboutLabel.hidden = false
                namePanel.hidden = false
                nameLabel.hidden = false
                alternar = true
                conteudo.hidden = true
                conteudo.text = ""
            }
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
