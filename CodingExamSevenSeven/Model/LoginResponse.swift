//
//  LoginResponse.swift
//  CodingExamSevenSeven
//
//  Created by Jomar Calandria on 8/28/24.
//

import Foundation

struct LoginResponse : Decodable {
    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData: Decodable {
    let username: String
    let email: String
}
