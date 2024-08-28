//
//  LoginService.swift
//  CodingExamSevenSeven
//
//  Created by Jomar Calandria on 8/28/24.
//

import Foundation

class LoginService {
    
    //this function should be for actual api call
    func loginUser(loginRequest: LoginRequest, completion: @escaping (_ result: LoginResponse?) -> Void) {
        //will just return a mock login response data since there's no actual api call
        let loginresponse = LoginResponse(errorMessage: nil, data: LoginResponseData(username: "sevenseven", email: "seven@seven.com"))
        completion(loginresponse)
    }
}
