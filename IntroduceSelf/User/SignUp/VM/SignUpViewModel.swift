//
//  SignUpViewModel.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/08.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation

class SignUpViewModel {
    var user = UserModel().setUser()
    var email: String {
        get {
            return user.email
        }
        set(newVal) {
            user.email = newVal
        }
    }
    
    func checkConfirmPw(first: String, confirm: String) -> Bool {
        print("first: ", first, " confirm: ", confirm)
        if first == confirm {
            user.password = first
            return true
        }
        return false
    }
    
    func checkFirstPw(_ first: String) -> Bool {
        var count = 0
        
        let U = "^(?=.*[A-Z]).{8}$"
        let L = "^(?=.*[a-z]).{8}$"
        let S = "^(?=.*[$&+,:;=?@#|'<>.^*()%!-]).{8}$"
        let D = "^(?=.*[0-9]).{8}$"
        
        if first.regEx(U) {
            count += 1
        }
        if first.regEx(L) {
            count += 1
        }
        if first.regEx(S) {
            count += 1
        }
        if first.regEx(D) {
            count += 1
        }
        
        if count >= 3 {
            return true
        }
        
        return false
    }
    
    func checkEmail(_ input: String) -> Bool {
        let express = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        if input.regEx(express) {
            user.email = input
            return true
        } else {
            return false
        }
    }
    
    func checkName(_ input: String) -> Bool {
        let express = "^[가-힣]{2,17}|[a-zA-Z]{2,10}\\s[a-zA-Z]{2,10}$"
        
        if input.regEx(express) {
            user.name = input
            return true
        } else {
            return false
        }
    }
    
    func checkPhone(_ input: String) -> Bool {
        let express = "^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$"
        
        if input.regEx(express) {
            user.phone = input.components(separatedBy: ["-"]).joined()
            return true
        } else {
            return false
        }
    }
    
    func checkBirth(_ input: String) {
        if input != "" {
            user.birth = input.components(separatedBy: ["년","월","일"," "]).joined()
        }
    }
}
