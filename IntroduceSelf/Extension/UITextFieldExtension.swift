//
//  UITextFieldExtension.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/06.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import RxGesture

extension UITextField {
    func setInputViewdatePicker(target: Any,  selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KR")
        self.inputView = datePicker
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
    func setRxCocoa(disposebag: DisposeBag, completion: @escaping (String) -> Void) {
        self.rx.text
        .orEmpty
        .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .subscribe(onNext: { res in
            completion(res)
        })
        .disposed(by: disposebag)
    }
    
    func setTextFieldLayout(holder: String) {
        self.frame.size = CGSize(width: 225, height: 30)
        self.font = self.font?.withSize(20)
        self.returnKeyType = .done
        self.attributedPlaceholder = NSAttributedString(string: holder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func editingDidEndOnExit(disposebag: DisposeBag, completion: @escaping () -> Void) {
        self.rx.controlEvent([.editingDidEndOnExit])
            .asObservable()
            .subscribe(onNext: { _ in
                completion()
            })
            .disposed(by: disposebag)
    }
}
