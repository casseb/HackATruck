//
//  Member.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Edited by Ray Fix on 4/12/15.
//  Copyright (c) 2014-2015 Razeware LLC. All rights reserved.
//

import Foundation

class Member {
  let imageName: String?
  let name: String?
  let title: String?
  let location: String?
  let about: String?
  let web: String?
  let facebook: String?
  let twitter: String?
  
  init(dictionary:NSDictionary) {
    imageName = dictionary["image"]    as? String
    name      = dictionary["name"]     as? String
    title     = dictionary["title"]    as? String
    location  = dictionary["location"] as? String
    web       = dictionary["web"]      as? String
    facebook  = dictionary["facebook"] as? String
    twitter   = dictionary["twitter"]  as? String
    
    // fixup the about text to add newlines
    let unescapedAbout = dictionary["about"] as? String
    about = unescapedAbout?.stringByReplacingOccurrencesOfString("\\n", withString:"\n", options:[], range:nil)
  }
  
  class func loadMembersFromFile(path:String) -> [Member]
  {
    var members:[Member] = []   
    
    do {
        let sdata = try NSData(contentsOfFile: path, options: []) as? NSData
            
    
    //var error:NSError? = nil
   // if let data = NSData(contentsOfFile: path, options:nil, error:&error),
        if let data = sdata{
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary
                let team = json!["team"] as? [NSDictionary]
                for memberDictionary in team! {
                    let member = Member(dictionary: memberDictionary)
                    members.append(member)
                }
            }catch{}
        }
    
        } catch let error as NSError {
            print(error.localizedDescription)
    }
    
    
    
     /*   do {
            let data = try NSData(contentsOfFile: path, options: [])
            let jsonObj = JSON(data: data)
            if jsonObj != JSON.null {
                print("jsonData:\(jsonObj)")
            } else {
                print("could not get json from file, make sure that file contains valid json.")
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        } */

    return members
  }
}
