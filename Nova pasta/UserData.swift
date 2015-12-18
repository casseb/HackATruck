//
//  User.swift
//
//  Created by Student on 12/14/15.
//


import Foundation

class UserLog {
    
    static var usuario: UserLog!
    
    var user: User!
    
    class func getReference() -> UserLog {
        self.usuario = (self.usuario ?? UserLog())
        return self.usuario
    }
    
    init(){
    }
    
    //Getter and Setter
    func setUser(u: User) {
        self.user = u
    }
    
    func getUser() -> User{
        return self.user
    }
}

