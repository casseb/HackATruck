//
//  MainViewController.swift
//


import UIKit

class MainViewController: UITableViewController {

    var users: [User] = []
    var user: User?
    var cards: [Card] = []
    var deck: Deck?
    var currentIndexMember: Int = 0
    var cardIndex: Int = -1
    var currentCell : UITableViewCell!
    var changeDirection: Bool = false

    
    // Mark: - View Lifetime
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // appearance and layout customization
        self.tableView.backgroundView = UIImageView(image:UIImage(named:"background"))
        self.tableView.estimatedRowHeight = 280
        self.tableView.rowHeight = UITableViewAutomaticDimension
   
        cardIndex = deck!.cards.count - 1
        
        //Swipe movement animation
        var aSwipeGesture = UISwipeGestureRecognizer(target:self, action:"swipeGesture:")
        aSwipeGesture.direction = .Left
        self.view.addGestureRecognizer(aSwipeGesture)
        
        aSwipeGesture = UISwipeGestureRecognizer(target:self, action:"swipeGesture:")
        aSwipeGesture.direction = .Right
        self.view.addGestureRecognizer(aSwipeGesture)
        
    }
    
    // Mark: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Card", forIndexPath: indexPath) as! CardTableViewCell
        if currentIndexMember != -1{
            let card = deck!.cards[currentIndexMember]
            cell.useCards(card)
            cell.aboutLabel.hidden = false
            cell.namePanel.hidden = false
            cell.nameLabel.hidden = false
            cell.alternar = true
            cell.conteudo.hidden = true
            cell.conteudo.text = ""
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    //Mark:- Animation cell fade in
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
            
            if !changeDirection {
                TipInCellAnimator.animateWithRotation(cell)
            }else{
                TipInCellAnimator.animateLeft(cell)
            }
    }
    
    
    //Mark:- events of swipe gestures
    
    func swipeGesture(sender:UISwipeGestureRecognizer) {
        
        if cardIndex != -1 {
        
            if sender.direction == .Left {
                currentIndexMember++
                if currentIndexMember > cardIndex {
                    currentIndexMember = 0
                }
                changeDirection = false
                self.tableView.reloadData()
            
            } else if sender.direction == .Right {
                currentIndexMember--
                if currentIndexMember < 0 {
                    currentIndexMember = cardIndex
                }
                changeDirection = true
                self.tableView.reloadData()
            
            }
        }
    }
    
}

