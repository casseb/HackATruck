//
//  Deck.swift
//
//  Created by Student on 12/14/15.
//

import Foundation

class Deck {
    
    let topic: String
    let category: String
    var owner: User? = nil
    var cards: [Card] = []
    let creator: User? = nil
    
    init(topic: String,category: String){
        self.topic = topic
        self.category = category
    }
}

