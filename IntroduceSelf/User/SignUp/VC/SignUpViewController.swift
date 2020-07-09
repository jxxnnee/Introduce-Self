//
//  SignUpViewController.swift
//  RxIntroduce
//
//  Created by 민경준 on 2019/12/11.
//  Copyright © 2019 민경준. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import SnapKit

class SignUpViewController: UIViewController {
    let viewModel = SignUpViewModel()
    var disposebag = DisposeBag()
    var isFillAll = BehaviorSubject(value: false)
    var tappedCount = 0
    var stackCount = 0

    var isNameValid = true
    var isUserEmailValid = true
    var isFirstPwValid = true
    var isConfirmPwValid = true
    var isBirthdayValid = true
    var isPhoneValid = true
    
    @IBOutlet weak var infoSV: UIStackView!
    @IBOutlet weak var signUpBtn: UIButton!
    lazy var nameView = UIView()
    lazy var userName = UITextField()
    
    lazy var emailView = UIView()
    lazy var userEmail = UITextField()
    
    lazy var fpView = UIView()
    lazy var firstPw = UITextField()
    lazy var cpView = UIView()
    lazy var confirmPw = UITextField()
    
    lazy var birthView = UIView()
    lazy var birthday = UITextField()
    
    lazy var phoneView = UIView()
    lazy var phone = UITextField()
    
    lazy var lineView = UIView()
    lazy var errorState = UILabel()
}

// Life Cycle
extension SignUpViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setRxSignUpBtn()
        self.appearNextUIView(self.tappedCount)
        // Do any additional setup after loading the view.
    }
}

// Custom Function
extension SignUpViewController {
    
    func checkEnableSignUp() -> Bool{
        var wouldEnable = true
        
        if !isNameValid {
            wouldEnable = false
        }
        if !isFirstPwValid {
            wouldEnable = false
        }
        if !isConfirmPwValid {
            wouldEnable = false
        }
        if !isUserEmailValid {
            wouldEnable = false
        }
        
        return wouldEnable
    }
    
    func appearNextUIView(_ tapped: Int) {
        switch tapped {
        case 0:
            print("ADD TO NAME VIEW")
            setRxNameTf()
            setNameTfLayout()
            stackObjects(self.nameView)
            self.tappedCount += 1
            self.userName.becomeFirstResponder()
        case 1:
            if isNameValid {
                print("ADD TO BIRTH VIEW")
                setBirthTfLayout()
                self.birthday.setInputViewdatePicker(target: self, selector: #selector(tapDone))
                stackObjects(self.birthView)
                self.tappedCount += 1
                self.birthday.becomeFirstResponder()
            } else {
                print("NAME IS NOT VALID")
            }
            
        case 2:
            if isBirthdayValid {
                print("ADD TO EMAIL VIEW")
                setRxEmailTf()
                setEmailTfLayout()
                stackObjects(self.emailView)
                self.tappedCount += 1
                self.userEmail.becomeFirstResponder()
            } else {
                print("BIRTH IS NOT VALID")
            }
        case 3:
            if isUserEmailValid {
                print("ADD TO PASSWORD VIEW")
                setRxPwTf()
                setPwTfLayout()
                stackObjects(self.fpView)
                stackObjects(self.cpView)
                self.tappedCount += 1
                self.firstPw.becomeFirstResponder()
            } else {
                print("EMAIL IS NOT VALID")
            }
        case 4:
            print("FIRST: ", isFirstPwValid, "CONFIRM: ", isConfirmPwValid)
            if isFirstPwValid && isConfirmPwValid {
                print("ADD TO PHONE VIEW")
                setRxPhoneTf()
                setPhoneTfLayout()
                stackObjects(self.phoneView)
                self.tappedCount += 1
                self.phone.becomeFirstResponder()
            } else {
                print("PASSWORD IS NOT VALID")
            }
        case 5:
            if self.checkEnableSignUp() {
                
            } else {
                print("PHONE IS NOT VALID")
            }
        default:
            break
        }
    }
    
    func stackObjects(_ view: UIView) {
        self.infoSV.insertArrangedSubview(view, at: self.stackCount)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.infoSV.layoutIfNeeded()
        })
        self.stackCount += 1
    }
    
    func createUser(_ complete: Bool) {
        if complete {
            print("COMPLETE CREATE USER!")
        }
    }
    
    @objc func tapDone() {
       if let datePicker = self.birthday.inputView as? UIDatePicker { // 2-1
           let dateformatter = DateFormatter() // 2-2
            dateformatter.dateFormat = "yyyy년 MM월 dd일"
           self.birthday.text = dateformatter.string(from: datePicker.date) //2-4
       }
        self.isBirthdayValid = true
        self.birthday.resignFirstResponder() // 2-5
    }
}
