//
//  AuthViewModel.swift
//  firebase-auth-ios
//
//  Created by Waheed Abbas on 25/06/2024.
//

import Foundation

enum AuthState
{
    case notLoaded
    case loading
    case success
    case failed(message : String)
}
class AuthViewModel : ObservableObject
{
    
    @Published var loginState : AuthState = .notLoaded
    @Published var signUpState : AuthState = .notLoaded
    
    private let loginService : LoginService
    private let signUpService : SignupService
    init(loginService: LoginService, signUpService: SignupService) {
        self.loginService = loginService
        self.signUpService = signUpService
    }
    func loginUser(email : String, password : String) async
    {
        self.loginState = .loading
        let result = await loginService.login(email: email, password: password)
        
        switch result {
        case .success(let email):
            print("Logged in with email: \(email)")
            self.loginState = .success
        case .failure(let error):
            print("Failed to login: \(error.localizedDescription)")
            self.loginState = .failed(message: error.localizedDescription)
        }
    }
    func signUpUser(email : String, password : String) async
    {
        self.signUpState = .loading
        let result = await signUpService.signup(email: email, password: password)
        
        switch result {
        case .success(let email):
            print("Signed up with email: \(email)")
            self.signUpState = .success
        case .failure(let error):
            print("Failed to Sign up: \(error.localizedDescription)")
            self.signUpState = .failed(message: error.localizedDescription)
        }
    }
}
