//
//  SignUpViewModel.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/08.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation

class SignUpViewModel {
    
    func checkConfirmPw(first: String, confirm: String) -> Bool {
        print("first: ", first, " confirm: ", confirm)
        if first == confirm {
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
        
        return input.regEx(express)
    }
    
    func checkName(_ input: String) -> Bool {
        let express = "^[가-힣]{2,17}|[a-zA-Z]{2,10}\\s[a-zA-Z]{2,10}$"
        
        return input.regEx(express)
    }
    
    func checkPhone(_ input: String) -> Bool {
        let express = "^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$"
        
        return input.regEx(express)
    }
}
