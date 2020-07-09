//
//  StringExtension.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/08.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation


extension String {
    func regEx(_ express: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", express).evaluate(with: self)
    }
}
