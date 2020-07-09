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

class LoginViewModel {
    var userId = ""
    var userPw = ""
    var errorString = ""
    var isSuccess = true
    var userEmail = ""
    var userName = ""
    
    func setUserId(_ id: String) {
        userId = id
        print("USER ID: ", userId)
    }
    
    func setUserPW(_ pw: String) {
        userPw = pw
        print("USER PW: ", userPw)
    }
    
    func checkAuth(){
            
        print("CHECKING....")
        
        Auth.auth().signIn(withEmail: self.userId, password: self.userPw) { result, error in
            if error != nil {
                self.errorString = error!.localizedDescription
                self.isSuccess = false
                print("ERROR: ", self.errorString)
            } else {
                self.userEmail = result!.user.email ?? "UserEmail"
                self.userName = result!.user.displayName ?? "UserName"
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>, completion: <#T##AuthDataResultCallback?##AuthDataResultCallback?##(AuthDataResult?, Error?) -> Void#>)
    }
}
