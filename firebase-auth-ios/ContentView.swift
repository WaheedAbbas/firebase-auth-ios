//
//  ContentView.swift
//  firebase-auth-ios
//
//  Created by Waheed Abbas on 25/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    let loginService = LoginServiceFirebase()
    let signUpService = SignupServiceFirebase()
    var body: some View {
        LoginScreenView(authViewModel: AuthViewModel(loginService: self.loginService, signUpService: self.signUpService))
        .padding()
    }
}

#Preview {
    ContentView()
}
