//
//  Const.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/03.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation

struct K {
    struct ProductionServer {
        static let baseURL = "http://52.78.157.220:3000"
    }
    
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
