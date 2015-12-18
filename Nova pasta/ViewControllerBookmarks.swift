//
//  ViewControllerBookmarks.swift
//  CardsProject1.0
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class ViewControllerBookmarks: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableBookmarks: UITableView!
    
    // let url_to_request:String = "http://localhost:3000/"   //2sv1d
     let url_to_request:String = "https://api.myjson.com/bins/"
    
    var users: [User] = []
    var cards: [Card] = []
    var currentIndexMember: Int = -1
    var currentCell : UITableViewCell!
    var changeDirection: Bool = false
    
    var listNumRows: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //   let request =  HTTPRequest(url: url_to_request)
        //    request.getUserArrayData("users?login=" + login,result: updateUserInfo)
        //   request.getUserArrayData("users",result: updateUserInfo)
        
        let request =  HTTPRequest(url: url_to_request)
        request.getUserArrayData("1gf7l",result: updateUserInfoDict)
        
        tableBookmarks.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if currentIndexMember != -1 {
            return self.users[0].decks.count
        }
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! bookmarksCell
    
        if currentIndexMember != -1{
            let deck = users[0].decks[indexPath.row]
            cell.LabelN.text = deck.topic
        }
        
        return cell
    }
    
    // MARK:- PrepareForSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "cardView"{
            
            let cell = sender as! UITableViewCell
            let indexPath = tableBookmarks.indexPathForCell(cell)
            let cardView: MainViewController = segue.destinationViewController as! MainViewController
            cardView.deck = users[0].decks[indexPath!.row]
            cardView.user = users[0]
        }
        
    }
    
    
    func updateUserInfoDict(let data: NSDictionary){
        
        var cards: [Card] = []
        
        for userInfo in (data["users"] as? NSArray)! {
            
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
        listNumRows = self.users[0].decks.count
        tableBookmarks.reloadData()
        
    }

    
    func updateUserInfo(let data: NSArray){
        
        var cards: [Card] = []
        
        for userInfo in data {
            
            let user =  User(login: userInfo["login"] as! String, password:"", name: userInfo["name"] as! String)
            for deck in (userInfo["decks"] as? NSArray)!{
                cards = []
                for card in (deck["cards"] as? NSArray)!{
                    let vcard = Card(title: card["title"] as! String,objective: card["objective"] as! String, content: card["content"] as! String)
                    vcard.creator = user
                    cards.append(vcard)
                }
                
                let vdeck = Deck(topic: deck["topic"] as! String, category: deck["category"] as! String)
                vdeck.cards = cards
                vdeck.owner = user
                user.decks.append(vdeck)
                // self.cards = cards
            }
            self.users.append(user)
            
        }
        currentIndexMember = 0
        listNumRows = self.users[0].decks.count
        
    }
    
}
