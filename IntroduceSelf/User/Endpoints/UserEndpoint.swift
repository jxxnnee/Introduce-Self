//
//  UserRouter.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/08.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation
import Alamofire

enum UserEndpoint: APIConfiguration {
    
    case emailRegister(data: Data)
    
    var method: HTTPMethod {
        switch self {
        case .emailRegister:
            return .post
        }
    }
    
    var path: String {
        switch  self {
        case .emailRegister:
            return "/users"
        }
    }
    
    internal func encodeData(with request: URLRequest) throws -> URLRequest {
        switch self {
        case .emailRegister(let data):
            return try self.jsonUrlEncode(request, with: data)
        }
    }
    
    internal func jsonUrlEncode(_ request: URLRequest, with jsonData: Data) throws -> URLRequest{
        var urlRequest = try request.asURLRequest()
        if urlRequest.value(forHTTPHeaderField: HTTPHeaderField.contentType.rawValue) == nil {
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        }
        urlRequest.httpBody = jsonData
        
        return urlRequest
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = 10
        
        return try self.encodeData(with: request)
    }
    
}
