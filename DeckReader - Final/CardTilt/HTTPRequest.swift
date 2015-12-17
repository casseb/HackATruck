//
//  HTTPRequest.swift
//  nsurlsession_tutorial
//
//  Created by Helio Ribeiro da Cruz on 12/16/15.
//  Copyright © 2015 kaleidosstudio. All rights reserved.
//
import Foundation
class HTTPRequest {
    
    
    var url_to_request:String?
    var users: [User] = []
    
    init(url: String){
        self.url_to_request = url
    }
    
    func getUserArrayData(endpoint: String, result: (NSArray)->Void){
        
        // var user: User? = nil
        
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: url_to_request! + endpoint)
        
        let task = session.dataTaskWithURL(shotsUrl!) {
            (var data, response, error) -> Void in
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSArray
                result(jsonData)
                
            } catch _ {
                // Error
            }
        }
        
        task.resume()
        
    }
    
    func updateUserInfo(let data: NSArray){
        
        //   var decks: [Deck] = []
        var cards: [Card] = []
        for userInfo in data {
            let user =  User(login: String(userInfo["name"]!), password:"", name: String(userInfo["login"]!))
            for deck in (userInfo["decks"] as? NSArray)!{
                for card in (deck["cards"] as? NSArray)!{
                    cards.append(Card(title: String(card["title"]!),objective: String(card["objecttive"]!), content: String(card["content"]!)))
                }
                let deck = Deck(topic: String(deck["topic"]!), category: String(deck["category"]!))
                deck.cards = cards
                deck.owner = user
                user.decks.append(deck)
            }
            self.users.append(user)
        }
    }
    
    
    
}


