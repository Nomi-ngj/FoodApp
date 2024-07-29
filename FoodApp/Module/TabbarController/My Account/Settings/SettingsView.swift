//
//  SettingsView.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 28/07/2024.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @ObservedObject private var viewModel = SettingsViewModel()
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                Toggle(isOn: $viewModel.isDarkMode) {
                    Text("Dark Mode")
                }
            }
            
            Section(header: Text("General")) {
                Toggle(isOn: $viewModel.notificationsEnabled) {
                    Text("Enable Notifications")
                }
                
                Toggle(isOn: $viewModel.faceIDEnabled) {
                    Text("Enable Face ID / Touch ID")
                }
                
                NavigationLink(destination: ChangePasswordView()) {
                    Text("Change Password")
                }
            }
            
            Section(header: Text("Support")) {
                NavigationLink(destination: ContactUsView()) {
                    Text("Contact Us")
                }
                
                NavigationLink(destination: FAQsView()) {
                    Text("FAQs")
                }
            }
        }
        .onAppear{
            viewModel.isDarkMode = colorScheme == .dark
            viewModel.currentColorScheme(colorScheme: colorScheme)
        }
        .environment(\.colorScheme, viewModel.isDarkMode ? .dark : .light)
    }
}
