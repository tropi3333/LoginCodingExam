//
//  LoginValidation.swift
//  CodingExamSevenSeven
//
//  Created by Jomar Calandria on 8/28/24.
//

import Foundation

struct ValidationResult {
    let success: Bool
    let error: String?
}

struct LoginValidation {
    //simple validation
    func validate(for loginRequest: LoginRequest) -> ValidationResult{
        if loginRequest.userEmail!.isEmpty {
            return ValidationResult(success: false, error: "Username is empty")
        }
        
        if loginRequest.userPassword!.isEmpty {
            return ValidationResult(success: false, error: "User Password is empty")
        }
        
        return ValidationResult(success: true, error: nil)
    }
}
