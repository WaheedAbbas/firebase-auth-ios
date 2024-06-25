//
//  LoginScreenView.swift
//  firebase-auth-ios
//
//  Created by Waheed Abbas on 25/06/2024.
//

import SwiftUI

struct LoginScreenView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @StateObject var authViewModel : AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 15){
               
                if case AuthState.failed(let message) = authViewModel.loginState {
                    Text(message)
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                if case AuthState.success = authViewModel.loginState {
                    Text("Login Successful!")
                        .offset(y: -10)
                        .foregroundColor(.green)
                }
                TextFieldWithLabel(title: "Username", text: self.$email)
                SecureTextFieldWithLabel(title: "Password", text: self.$password)
                if case AuthState.loading = authViewModel.loginState {
                    ProgressView()
                }else {
                    Button("Login") {
                        self.loginUser()
                    }.primaryButtonStyle()
                }
                HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: SignUpScreenView(authViewModel: self.authViewModel)) {
                        Text("Signup")
                            .foregroundColor(AppColors.primaryColor)
                    }
                }
            }.padding(20)
        }
    }
    
    private func loginUser()
    {
        Task {
            await self.authViewModel.loginUser(email: self.email, password: self.password)
        }
    }
}
