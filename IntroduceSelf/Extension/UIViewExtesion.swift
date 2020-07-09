//
//  UIViewExtesion.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/06.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func copyView<T: UIView>() throws -> T? {
        let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
        
        return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? T
    }
    
    func addSubViews(_ objects: [UIView]) {
        for object in objects {
            self.addSubview(object)
        }
    }
    
    func setLineViewLayout(){
        // Line Setting
        self.frame.size.height = 1
        self.alpha = 0.3
        self.backgroundColor = .darkGray
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
