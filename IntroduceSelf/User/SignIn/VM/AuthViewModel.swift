//
//  LoginViewModel.swift
//  RxIntroduce
//
//  Created by 민경준 on 2019/12/05.
//  Copyright © 2019 민경준. All rights reserved.
//

import Foundation
import RxSwift
import FirebaseAuth

class AuthViewModel {
    var errorString = ""
    
    var userEmail = ""
    var userPw = ""
    var userName = ""
    var isSuccess = true
    
    
    var signUpEmail = ""
    var signUpPw = ""
    var signUpName = ""
    var pwIsSame = false
    var pwError = ""
    
    
    
    func setUserEmail(_ email: String) {
        self.userEmail = email
        print("USER ID: ", userEmail)
    }
    
    func setUserPW(_ pw: String) {
        self.userPw = pw
        print("USER PW: ", userPw)
    }
    
    func setUserName(_ name: String) {
        self.signUpName = name
        print("USER NAME: ", self.signUpName)
    }
    
    
    func checkAuth(){
        Auth.auth().signIn(withEmail: self.userEmail, password: self.userPw) { result, error in
            if error != nil {
                self.errorString = error!.localizedDescription
                self.isSuccess = false
            } else {
                self.userEmail = result!.user.email ?? "UserEmail"
                self.userName = result!.user.displayName ?? "UserName"
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: self.signUpEmail, password: self.signUpPw) { (result, error) in
            if error != nil {
                print("ERROR: ", error!.localizedDescription)
            } else {
                print("COMEPLETE CREATE USER!")
            }
        }
    }
}
