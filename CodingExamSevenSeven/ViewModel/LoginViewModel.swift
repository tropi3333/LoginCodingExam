//
//  LoginViewModel.swift
//  CodingExamSevenSeven
//
//  Created by Jomar Calandria on 8/28/24.
//

import Foundation

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

struct LoginViewModel {
    
    let service:LoginService
    var delegate: LoginViewModelDelegate?
    
    init(loginService: LoginService) {
        self.service = loginService
    }

    func loginUser(loginRequest: LoginRequest){
        let validationResult = LoginValidation().validate(for: loginRequest)

        if validationResult.success {
            service.loginUser(loginRequest: loginRequest) { result in
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.delegate?.didReceiveLoginResponse(loginResponse: result)
                }
            }
        }
        self.delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(errorMessage: validationResult.error, data: nil))
    }
}
