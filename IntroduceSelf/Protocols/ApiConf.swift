//
//  router.protocols.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/03.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    
    func encodeData(with request: URLRequest) throws -> URLRequest
    func jsonUrlEncode(_ request: URLRequest, with data: Data) throws -> URLRequest
    
    func asURLRequest() throws -> URLRequest
}
