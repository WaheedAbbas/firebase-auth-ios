//
//  SecureTextFieldWithLabel.swift
//  firebase-auth-ios
//
//  Created by Waheed Abbas on 25/06/2024.
//

import SwiftUI

struct SecureTextFieldWithLabel: View {
    let title: String
    let text: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(self.title).foregroundColor(AppColors.primaryColor)
            SecureField("",text: self.text, prompt: Text("Required")).padding(12.0)
                .background(RoundedRectangle(cornerRadius: 8.0, style: .continuous)
                    .stroke(AppColors.primaryColor, lineWidth: 1.0))
        }
    }
}
