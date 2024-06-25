//
//  SignUpScreenView.swift
//  firebase-auth-ios
//
//  Created by Waheed Abbas on 25/06/2024.
//

import SwiftUI

struct SignUpScreenView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @StateObject var authViewModel : AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15){
                
                if case AuthState.failed(let message) = authViewModel.signUpState {
                    Text(message)
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                if case AuthState.success = authViewModel.signUpState {
                    Text("Signup Successful!")
                        .offset(y: -10)
                        .foregroundColor(.green)
                }
                TextFieldWithLabel(title: "Username", text: self.$email)
                SecureTextFieldWithLabel(title: "Password", text: self.$password)
                if case AuthState.loading = authViewModel.signUpState
                {
                    ProgressView()
                }else {
                    Button("Register") {
                        signUp()
                    }.primaryButtonStyle()
                }
                HStack {
                    Text("Already have an account?")
                    Button("Login") {
                        self.presentationMode.wrappedValue.dismiss()
                    }.foregroundColor(AppColors.primaryColor)
                    
                }.padding(20)
            }
        }
    }
    func signUp() {
        Task {
            await self.authViewModel.signUpUser(email: self.email, password: self.password)
        }
    }
}
