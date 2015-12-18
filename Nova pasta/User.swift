import Foundation

class User {
    
    let login: String?
    let password: String?
    let name: String?
    var decks: [Deck] = []
    
    init(login:String,password:String, name:String){
        self.login = login
        self.password = password
        self.name = name
    }
    
}

