//
//  userdefault.utils.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/03.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireHelper {
    func ErrorHandling(_ err: AFError) {
        switch err {
        case .sessionTaskFailed(let error):
            print("ERROR: ", error.localizedDescription)
            print("CODE: ", err._code)
            
        case .invalidURL(let url):
            print("URL: ", url)
        default:
            print("Error: ", err)
        }
    }
    
    func parsing(_ err: Error) {
        let url = String(describing: err).components(separatedBy: " ").filter { str in
            return str.contains("NSErrorFailingURLKey=")
        }
        let code = String(describing: err).components(separatedBy: " ").filter { str in
            return str.contains("Code=")
        }
        print(code[0], url[0])
    }
}
