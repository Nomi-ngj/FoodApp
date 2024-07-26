//
//  LoginView.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct LoginView: View {
    
    let primaryColor = Theme.color.primaryColor
    @State private var isTabBarActive = false

    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                
                // Logo
                Theme.images.appLogo // Replace with your logo image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100) // Adjust size as needed
                
                Text(Theme.localized.welcome)
                    .font(Theme.fonts.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(primaryColor) // Adjust color as needed
                
                Spacer()
                
                // Social Login Buttons
                HStack(spacing: 30) {
                    Button(action: {
                        // Google login action
                        pushTabbar()
                    }) {
                        ZStack {
                            socialButtonWithIcon(filledColor: .white, image: Image("google"))
                        }
                    }
                    
                    Button(action: {
                        // Facebook login action
                        pushTabbar()
                    }) {
                        socialButtonWithIcon(filledColor: Color(hex: "#1877F2"), image: Image("facebook"))
                    }
                    
                    Button(action: {
                        // Apple login action
                        pushTabbar()
                    }) {
                        socialButtonWithIcon(filledColor: Theme.color.disabledColor, image: Image("apple"))
                    }
                }
                
                Text(Theme.localized.Or)
                    .font(Theme.fonts.caption1)
                    .foregroundColor(Color.gray)
                    .padding(.vertical, 20)
                
                // Email and Password Fields
                VStack {
                    TextField(Theme.localized.emailAddress, text: .constant(""))
                        .customTextFieldStyle()
                    
                    SecureField(Theme.localized.password, text: .constant(""))
                        .customTextFieldStyle()
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            // Forgot password action
                        }) {
                            Text(Theme.localized.forgotPassword)
                                .font(Theme.fonts.caption2)
                                .foregroundColor(primaryColor)
                        }
                    }
                }.padding(.bottom, 20)
                
                // Login and Register Buttons
                VStack {
                    Button(action: {
                        // Login action
                        pushTabbar()
                    }) {
                        Text(Theme.localized.login)
                    }
                    .buttonStyle(BorderedButtonStyle(borderColor: primaryColor, foregroundColor: .white, backgroundColor: primaryColor, font: Theme.fonts.subhead2))
                    
                    Button(action: {
                        // Register action
                    }) {
                        Text(Theme.localized.register)
                    }
                    .buttonStyle(BorderedButtonStyle(borderColor: primaryColor, foregroundColor: primaryColor, backgroundColor: .white, font: Theme.fonts.subhead2))
                         
                }.padding(.bottom, 20)
                
                Spacer()
                
                // Skip Button
                Button(action: {
                    // Skip action
                    pushTabbar()
                }) {
                    Text(Theme.localized.skipAndContinueAsaGuest)
                        .font(Theme.fonts.caption1)
                        .foregroundColor(primaryColor)
                }
                
                Spacer()
                
                // NavigationLink
                NavigationLink(
                    destination: TabBarController(tabs: TabViewType.allCases.map { TabBarController.TabItem(viewType: $0) })
                        .navigationBarBackButtonHidden(false), // Hide back button
                    isActive: $isTabBarActive,
                    label: { EmptyView() }
                )
            }
            .padding()
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
    
    func pushTabbar(){
        isTabBarActive = true
    }
    
    @ViewBuilder
    func socialButtonWithIcon(filledColor:Color, image:Image) -> some View {
        ZStack {
            Rectangle()
                .fill(filledColor) // You can change the color as needed
                .frame(width: 50, height: 50) // Set the size of the rectangle
                .cornerRadius(15) // Set the corner radius
                .shadow(color: Theme.color.borderTintInputColor, radius: 4, x: 0, y: 3) // Add shadow with specified color, radius, and offset
            
            image
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
        }
    }
}


#Preview {
    LoginView()
}
