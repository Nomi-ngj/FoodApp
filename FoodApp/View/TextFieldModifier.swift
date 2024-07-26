//
//  TextFieldModifier.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Theme.fonts.textField)
            .padding()
            .background(Color.white)
            .cornerRadius(5.0)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(Theme.color.primaryColor, lineWidth: 1.0)
            )
    }
}

extension View {
    func customTextFieldStyle() -> some View {
        self.modifier(TextFieldModifier())
    }
}
