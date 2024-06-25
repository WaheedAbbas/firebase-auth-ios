//
//  LoginService.swift
//  firebase-auth-ios
//
//  Created by Waheed Abbas on 25/06/2024.
//

import Foundation
import FirebaseAuth

protocol LoginService
{
    func login(email : String, password : String) async -> Result<String, Error> 
}

class LoginServiceFirebase: LoginService {
    func login(email: String, password: String) async -> Result<String, Error> {
        await withCheckedContinuation { continuation in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let loginError = error {
                    continuation.resume(returning: .failure(loginError))
                } else if let email = authResult?.user.email {
                    continuation.resume(returning: .success(email))
                } else {
                    continuation.resume(returning: .failure(NSError(domain: "LoginServiceFirebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"])))
                }
            }
        }
    }
}
