//
//  TextFieldModifier.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    let backgroundColor:Color
    func body(content: Content) -> some View {
        content
            .font(Theme.fonts.textField)
            .padding()
            .background(backgroundColor)
            .cornerRadius(5.0)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(Theme.color.primaryColor, lineWidth: 1.0)
            )
    }
}

extension View {
    func customTextFieldStyle(backgroundColor:Color) -> some View {
        self.modifier(TextFieldModifier(backgroundColor: backgroundColor))
    }
}
