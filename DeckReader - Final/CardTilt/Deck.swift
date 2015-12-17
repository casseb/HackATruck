//
//  Deck.swift
//  CardTilt
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 RayWenderlich.com. All rights reserved.
//

import Foundation

class Deck {
    
    let topic: String
    let category: String
    var owner: User? = nil
    var cards: [Card] = []
    let creator: User? = nil
    //let created: String?
    
    init(topic: String,category: String){
        self.topic = topic
        self.category = category
    }
    
    init(dictionary:NSDictionary) {
        topic = (dictionary["topic"]    as? String)!
        category = (dictionary["category"]     as? String)!
        // image  = dictionary["image"] as? String
        // fixup the about text to add newlines
    }
    
    class func loadDeckFromFile(path:String) ->Deck
    {
        var deck =  Deck(topic: "",category: "")
        
        do {
            let sdata = try NSData(contentsOfFile: path, options: []) as? NSData
            
            //var error:NSError? = nil
            // if let data = NSData(contentsOfFile: path, options:nil, error:&error),
            if let data = sdata{
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary
                    let team = json!["deck"] as? NSDictionary
                    deck = Deck(dictionary: team!)
                    /* for i in team! {
                    let vlr = i
                    print(vlr)
                    //let card = Card(dictionary: memberDictionary)
                    //cards.append(card)
                    } */
                }catch{}
            }
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return deck
    }
    
}

