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
    @IBOutlet var namePanel: UIView!
    @IBOutlet weak var conteudo: UILabel!
    
    var content: String?
    
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
    
    func useCards(card:Card) {
        // Round those corners
        mainView.layer.cornerRadius = 10;
        mainView.layer.masksToBounds = true;
        
        // Fill in the data
        nameLabel.text = card.title!
        aboutLabel.text = card.objective
        content = card.content
        
        //aboutLabel.hidden = true
        namePanel.hidden = false
        nameLabel.hidden = false
        
        
        // Fill the buttons and show or hide them
        webLabel.text = card.creator?.name
        
        
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
        
        if (sender.direction == .Down || sender.direction == .Up) {
            
            if alternar == true{
                TipInCellAnimator.animateWithFlip(self)
                aboutLabel.hidden = true
                namePanel.hidden = true
                nameLabel.hidden = true
                alternar = false
                conteudo.hidden = false
                conteudo.text = content
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

}
