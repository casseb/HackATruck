//
//  Card.swift
//  CardTilt
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 RayWenderlich.com. All rights reserved.
//


import Foundation

class Card {
    
    let title: String?
    let objective: String?
    let content: String?
    let image: String? = nil
    var creator: User? = nil
    //let tags: [String?]
    //let created: String?
    
    init(title: String,objective: String,content:String){
        self.title = title
        self.objective = objective
        self.content = content
        
    }
    
 /*  init(dictionary:NSDictionary) {
        title = dictionary["title"]    as? String
        objective = dictionary["objective"]     as? String
        // image  = dictionary["image"] as? String
        // fixup the about text to add newlines
        let unescapedAbout = dictionary["content"] as? String
        content = unescapedAbout?.stringByReplacingOccurrencesOfString("\\n", withString:"\n", options:[], range:nil)
    }
    
    class func loadCardsFromFile(path:String) -> [Card]
    {
        var cards:[Card] = []
        
        do {
            let sdata = try NSData(contentsOfFile: path, options: []) as? NSData
            
            
            //var error:NSError? = nil
            // if let data = NSData(contentsOfFile: path, options:nil, error:&error),
            if let data = sdata{
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary
                    let team = json!["deck"] as? [NSDictionary]
                    for memberDictionary in team! {
                        let card = Card(dictionary: memberDictionary)
                        cards.append(card)
                    }
                }catch{}
            }
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return cards
    } */
    
}
