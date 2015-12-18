//
//  CardTableViewCell.swift
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
        
        //Swipe movement animation
        let aSwipeGesture2 = UISwipeGestureRecognizer(target:self, action:"swipeGesture:")
        aSwipeGesture2.direction = .Up
        self.addGestureRecognizer(aSwipeGesture2)
        
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
}
