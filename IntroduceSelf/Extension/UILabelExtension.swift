//
//  UILabelExtension.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/08.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setLabelLayout(text: String) {
        self.text = text
        self.font = self.font?.withSize(15)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
