//
//  SignUpRouters.swift
//  RxIntroduce
//
//  Created by OODDY MAC on 2020/07/09.
//  Copyright © 2020 민경준. All rights reserved.
//

import Foundation
import Alamofire

extension SignUpViewModel {
    
    func registerEmail(completion: @escaping () -> (), error: @escaping () -> ()) {
        print("USER: ", self.user)
        do {
            let data = try JSONEncoder().encode(self.user)
            print("DATA: ", data)
            AF.request(UserEndpoint.emailRegister(data: data)).validate().responseJSON(completionHandler: { res in
                print("RES: ", res)
                
                if case let .failure(error) = res.result {
                    let helper = AlamofireHelper()
                    helper.ErrorHandling(error)
            
                    return
                }

            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
