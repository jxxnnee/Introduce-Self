//
//  SignUpLayoutSetting.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/07.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

// Set UIView layout
extension SignUpViewController {
    func setNameTfLayout() {
        var label = UILabel()
        label.setLabelLayout(text: "이름")
        
        var line = UIView()
        line.setLineViewLayout()
        
        self.userName.setTextFieldLayout(holder: "이름을 입력하세요.")
        self.nameView.addSubViews([label, line, self.userName])
        setSnapKitLayout(&self.nameView, label: &label, text: &self.userName, line: &line)
    }
    
    func setBirthTfLayout() {
        var label = UILabel()
        label.setLabelLayout(text: "생일")
        
        var line = UIView()
        line.setLineViewLayout()
        
        self.birthday.setTextFieldLayout(holder: "생일을 입력하세요.")
        self.birthView.addSubViews([label, line, self.birthday])
        setSnapKitLayout(&self.birthView, label: &label, text: &self.birthday, line: &line)
    }
    
    func setEmailTfLayout() {
        var label = UILabel()
        label.setLabelLayout(text: "이메일")
        
        var line = UIView()
        line.setLineViewLayout()
        
        self.userEmail.setTextFieldLayout(holder: "example@email.com")
        self.userEmail.keyboardType = .emailAddress
        self.emailView.addSubViews([self.userEmail, label, line])
        setSnapKitLayout(&self.emailView, label: &label, text: &self.userEmail, line: &line)
    }
    
    func setPwTfLayout() {
        var fpLabel = UILabel()
        fpLabel.setLabelLayout(text: "비밀번호")
        
        var fpLine = UIView()
        fpLine.setLineViewLayout()
        
        self.firstPw.setTextFieldLayout(holder: "비밀번호(영문,특문,숫자 8자리 이상)")
        self.firstPw.isSecureTextEntry = true
        self.fpView.addSubViews([fpLabel, fpLine, self.firstPw])
        setSnapKitLayout(&self.fpView, label: &fpLabel, text: &self.firstPw, line: &fpLine)
        
        var cpLabel = UILabel()
        cpLabel.setLabelLayout(text: "비밀번호 확인")
        
        var cpLine = UIView()
        cpLine.setLineViewLayout()
        
        self.confirmPw.setTextFieldLayout(holder: "비밀번호를 재입력 해주세요.")
        self.confirmPw.isSecureTextEntry = true
        self.cpView.addSubViews([cpLabel, cpLine, self.confirmPw])
        setSnapKitLayout(&self.cpView, label: &cpLabel, text: &self.confirmPw, line: &cpLine)
    }
    
    func setPhoneTfLayout() {
        var label = UILabel()
        label.setLabelLayout(text: "핸드폰")
        
        var line = UIView()
        line.setLineViewLayout()
        
        self.phone.setTextFieldLayout(holder: "010-1234-5678")
        self.phoneView.addSubViews([label, line, self.phone])
        setSnapKitLayout(&self.phoneView, label: &label, text: &self.phone, line: &line)
    }

}


// Custom Function for Set Layout
extension SignUpViewController {
    func setSnapKitLayout(_ view: inout UIView, label: inout UILabel,
                          text: inout UITextField, line: inout UIView) {
        view.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.left.equalTo(view).offset(20)
        }
        
        text.snp.makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.top.equalTo(label.snp.bottom).offset(5)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(text.snp.bottom).offset(10)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(1)
        }
    }
}
