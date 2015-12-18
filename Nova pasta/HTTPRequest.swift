//
//  HTTPRequest.swift
//
//  Created by Helio Ribeiro da Cruz on 12/16/15.
//
import Foundation
class HTTPRequest {
    
    var url_to_request:String?
    var users: [User] = []
    
    init(url: String){
        self.url_to_request = url
    }
    
    func getUserArrayData(endpoint: String, result: (NSDictionary)->Void){
        
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: url_to_request! + endpoint)
        let task = session.dataTaskWithURL(shotsUrl!) {
            ( data, response, error) -> Void in
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
                result(jsonData)
                
            } catch _ {
                // Error
            }
        }
        task.resume()
    }
    
}


