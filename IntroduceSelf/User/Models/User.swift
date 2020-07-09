//
//  user.models.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/03.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation

final class UserModel {
    struct User: Codable {
        var name: String
        var email: String
        var password: String
        var birth: String
        var phone: String
    }
    
    func setUser(name: String = "", email: String = "",
                 password: String = "", birth: String = "", phone: String = "" ) -> User {
        
        let newUser = User(name: name, email: email,
                           password: password, birth: birth, phone: phone)
        
        return newUser
    }
}
