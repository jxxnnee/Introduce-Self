//
//  SignUpRxSetting.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/07.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxGesture

// Set Rx to Object
extension SignUpViewController {
    func setRxNameTf() {
        self.userName.setRxCocoa(disposebag: self.disposebag, completion: { res in
            if self.viewModel.checkName(res) {
                self.isNameValid = true
                
            }
        })
        
        self.userName.editingDidEndOnExit(disposebag: self.disposebag, completion: {
            self.appearNextUIView(self.tappedCount)
        })
    }
    
    func setRxEmailTf() {
        self.userEmail.setRxCocoa(disposebag: self.disposebag, completion: { res in
            let isValid = self.viewModel.checkEmail(res)
            self.isUserEmailValid = isValid
        })
        
        self.userEmail.editingDidEndOnExit(disposebag: self.disposebag, completion: {
            self.appearNextUIView(self.tappedCount)
        })
    }
    
    func setRxPwTf() {
        self.firstPw.setRxCocoa(disposebag: self.disposebag, completion: { res in
            let isValid = self.viewModel.checkFirstPw(res)
            self.isFirstPwValid = isValid
        })
        
        self.firstPw.editingDidEndOnExit(disposebag: self.disposebag, completion: {
            self.confirmPw.becomeFirstResponder()
        })
        
        self.confirmPw.setRxCocoa(disposebag: self.disposebag, completion: { res in
            let isValid = self.viewModel.checkConfirmPw(first: self.firstPw.text ?? "", confirm: res)
            self.isConfirmPwValid = isValid
        })
        
        self.confirmPw.editingDidEndOnExit(disposebag: self.disposebag, completion: {
            self.appearNextUIView(self.tappedCount)
        })
    }
    
    func setRxPhoneTf() {
        self.phone.setRxCocoa(disposebag: self.disposebag, completion: { res in
            let isValid = self.viewModel.checkPhone(res)
            self.isPhoneValid = isValid
        })
        
        self.phone.editingDidEndOnExit(disposebag: self.disposebag, completion: {
            self.appearNextUIView(self.tappedCount)
        })
    }
    
    func setRxSignUpBtn() {
        self.signUpBtn.rx.tap
        .subscribe(onNext: { (_) in
            self.appearNextUIView(self.tappedCount)
        })
        .disposed(by: self.disposebag)
    }
}
