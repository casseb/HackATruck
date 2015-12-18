//
//  Card.swift
//
//  Created by Student on 12/14/15.
//


import Foundation

class Card {
    
    let title: String?
    let objective: String?
    let content: String?
    let image: String? = nil
    var creator: User?
    
    init(title: String,objective: String,content:String){
        self.title = title
        self.objective = objective
        self.content = content
        
    }
    
}
