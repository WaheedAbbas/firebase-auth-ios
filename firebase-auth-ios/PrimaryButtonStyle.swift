//
//  PrimaryButtonStyle.swift
//  firebase-auth-ios
//
//  Created by Waheed Abbas on 25/06/2024.
//

import SwiftUI


struct PrimaryButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3).bold(true)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.white)
            .background(AppColors.primaryColor)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
extension View {
    func primaryButtonStyle() -> some View {
        self.modifier(PrimaryButtonStyle())
    }
}
