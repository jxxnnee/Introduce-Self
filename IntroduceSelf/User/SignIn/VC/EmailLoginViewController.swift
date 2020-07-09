//
//  ViewController.swift
//  RxIntroduce
//
//  Created by 민경준 on 2019/12/04.
//  Copyright © 2019 민경준. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EmailLoginViewController: UIViewController {

    var disposebag = DisposeBag()
    let authVM = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setInfo()
        clickedLoginButtons()
        tappedSignUpButton()
    }
    
    
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var userPw: UITextField!
    @IBOutlet weak var emailLogin: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    private func setInfo() {
        userId.rx.text
            .orEmpty
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { email in
            self.authVM.setUserEmail(email)
        })
        .disposed(by: disposebag)
        
        userPw.rx.text
            .orEmpty
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { pw in
            self.authVM.setUserPW(pw)
        })
        .disposed(by: disposebag)
    }
    
    
    private func clickedLoginButtons() {
        //이메일로 로그인
        emailLogin.rx
            .tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { _ in
                self.authVM.checkAuth()
                sleep(2)
                DispatchQueue.main.async {
                    if self.authVM.isSuccess {
                        // 계정 인증 성공 -> 화면 전환
                        // Storyboard에서 뷰 컨트롤러에서 identifier가 미리 설정이 되어있어야 한다.
                        guard let welcome = self.storyboard?.instantiateViewController(withIdentifier: "welcomeViewController") as? WelcomeViewController else {
                            return
                        }
                        
                        welcome.paramUserID = self.authVM.userEmail
                        welcome.paramUserName = self.authVM.userName
                        
                        // welcome 컨트롤러 뷰로 넘어간다.
                        self.present(welcome, animated: true, completion: nil)
                    } else {
                        // 계정 인증 실패 -> 계정 확인 Alert
                        let alert = UIAlertController(title: "Wrong ID/PW", message: self.authVM.errorString, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .default, handler : nil)
                        alert.addAction(defaultAction)
                        self.present(alert, animated: false, completion: nil)
                        
                        print("ERROR: ", self.authVM.errorString)
                    }
                }
            })
        .disposed(by: disposebag)
    }
    
    func tappedSignUpButton() {
        self.signUp.rx.tap.subscribe(onNext: { (_) in
            guard let signUp = self.storyboard?.instantiateViewController(withIdentifier: "signUpViewController") as? SignUpViewController else {
                return
            }
            
            self.present(signUp, animated: true, completion: nil)
            
        })
        .disposed(by: self.disposebag)
    }


}

