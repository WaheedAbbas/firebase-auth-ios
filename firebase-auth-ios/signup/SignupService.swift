//
//  SignupService.swift
//  firebase-auth-ios
//
//  Created by Waheed Abbas on 25/06/2024.
//

import Foundation
import FirebaseAuth

protocol SignupService
{
    func signup(email : String, password : String) async -> Result<String, Error>
}

class SignupServiceFirebase: SignupService {
    func signup(email: String, password: String) async -> Result<String, Error> {
        await withCheckedContinuation { continuation in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let signupError = error {
                    continuation.resume(returning: .failure(signupError))
                } else if let email = authResult?.user.email {
                    continuation.resume(returning: .success(email))
                } else {
                    continuation.resume(returning: .failure(NSError(domain: "SignupServiceFirebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"])))
                }
            }
        }
    }
}
