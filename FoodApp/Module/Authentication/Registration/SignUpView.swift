//
//  RegistrationView.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject private var viewModel: SignUpViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel: SignUpViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing:20) {
            
            // Username Field
            TextField(Theme.localized.username, text: $viewModel.username)
                .customTextFieldStyle(backgroundColor: viewModel.backgroundColor, borderStrokeColor: viewModel.primaryColor)
            
            
            // Email Field
            TextField(Theme.localized.emailAddress, text: $viewModel.email)
                .customTextFieldStyle(backgroundColor: viewModel.backgroundColor, borderStrokeColor: viewModel.primaryColor)
            
            // Password Field
            SecureField(Theme.localized.password, text: $viewModel.password)
                .customTextFieldStyle(backgroundColor: viewModel.backgroundColor, borderStrokeColor: viewModel.primaryColor)
            
            // Confirm Password Field
            SecureField(Theme.localized.confirmPassword, text: $viewModel.confirmPassword)
                .customTextFieldStyle(backgroundColor: viewModel.backgroundColor, borderStrokeColor: viewModel.primaryColor)
            
            Spacer()
            // Registration Button
            Button(action: {
                viewModel.registerUser()
            }) {
                Text(Theme.localized.signUp)
                
            }
            .buttonStyle(BorderedButtonStyle(borderColor: viewModel.primaryColor, foregroundColor: viewModel.backgroundColor, backgroundColor: viewModel.primaryColor, font: Theme.fonts.subhead2))
            .disabled(viewModel.isSubmitting)
            
            // Error Message
            if let error = viewModel.registrationError {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        
        NavigationLink(
            destination: TabBarController(tabs: TabViewType.allCases.map { TabBarController.TabItem(viewType: $0) })
                .navigationBarBackButtonHidden(false), // Hide back button
            isActive: $viewModel.isTabBarActive,
            label: { EmptyView() }
        )
        .padding()
        .navigationTitle(Theme.localized.signUp)
        .customBackButton()
        .onAppear {
            // Update ViewModel when the view appears
            viewModel.updateColors(for: colorScheme)
            
            
        }
        .onChange(of: colorScheme) { newColorScheme in
            // Update ViewModel when the color scheme changes
            viewModel.updateColors(for: newColorScheme)
        }
    }
}

