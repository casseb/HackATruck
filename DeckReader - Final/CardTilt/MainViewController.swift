//
//  MainViewController.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Updated by Ray Fix on 4/12/15
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//


import UIKit

class MainViewController: UITableViewController {
    
    let url_to_request:String = "http://localhost:3000/"
    
    var members: [Member] = []
   
    var users: [User] = []
    var cards: [Card] = []
    var currentIndexMember: Int = -1
    var currentCell : UITableViewCell!
    var changeDirection: Bool = false
  
    
    // Mark: - Model
    
    func loadModel() {
      //  let path = NSBundle.mainBundle().pathForResource("TeamMembers", ofType: "json")
     //   members = Member.loadMembersFromFile(path!)
        
        
        let request =  HTTPRequest(url: url_to_request)
        //request.getUserArrayData("users?login=helio@gmail.com",result: updateUserInfo)
        request.getUserArrayData("users",result: updateUserInfo)

    }
    
    // Mark: - View Lifetime
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // load our model
        loadModel();
        
        // appearance and layout customization
        self.tableView.backgroundView = UIImageView(image:UIImage(named:"background"))
        self.tableView.estimatedRowHeight = 280
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
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
            let card = users[0].decks[3].cards[currentIndexMember]
            //cell.useMember(member)
            cell.useCards(card)
            cell.aboutLabel.hidden = false
            cell.namePanel.hidden = false
            cell.nameLabel.hidden = false
            cell.alternar = true
            cell.conteudo.hidden = true
            cell.conteudo.text = ""
            
            print("celula", cell.nameLabel)
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
        
        if sender.direction == .Left {
            currentIndexMember++
            if currentIndexMember > users[0].decks[3].cards.count - 1{
                currentIndexMember = 0
            }
            changeDirection = false
            self.tableView.reloadData()
            
        } else if sender.direction == .Right {
            currentIndexMember--
            if currentIndexMember < 0 {
                currentIndexMember = users[0].decks[3].cards.count - 1
            }
            changeDirection = true
            self.tableView.reloadData()
            
        }
        
    }
    
    
//    func updateUserInfo1(let data: NSArray){
//        
//        var cards: [Card] = []
//        for userInfo in data {
//            let user =  User(login: String(userInfo["name"]), password:"", name: String(userInfo["login"]))
//            for deck in (userInfo["decks"] as! NSArray){
//                for card in (deck["cards"] as! NSArray){
//                    var card = Card(title: String(card["title"]),objective: String(card["objective"]), content: String(card["content"]))
//                    card.creator = user
//                    cards.append(card)
//                }
//                let deck = Deck(topic: String(deck["topic"]), category: String(deck["category"]))
//                deck.cards = cards
//                deck.owner = user
//                user.decks.append(deck)
//                self.cards = cards
//            }
//            self.users.append(user)
//            
//        }
//        currentIndexMember = 0
//        self.tableView.reloadData()
//        
//        
//       
//    }
    
    func updateUserInfo(let data: NSArray){
        
        var cards: [Card] = []
        
        
        
        for userInfo in data {
            
            let user =  User(login: userInfo["name"] as! String, password:"", name: userInfo["login"] as! String)
            for deck in (userInfo["decks"] as? NSArray)!{
                cards = []
                for card in (deck["cards"] as? NSArray)!{
                    let card = Card(title: card["title"] as! String,objective: card["objective"] as! String, content: card["content"] as! String)
                    card.creator = user
                    cards.append(card)
                }
                
                let deck = Deck(topic: deck["topic"] as! String, category: deck["category"] as! String)
                deck.cards = cards
                deck.owner = user
                user.decks.append(deck)
                self.cards = cards
            }
            self.users.append(user)
            
        }
        currentIndexMember = 0
        self.tableView.reloadData()
        
    }


    
}

