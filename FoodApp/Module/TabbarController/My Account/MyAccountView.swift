//
//  MyAccountView.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import Foundation
import UIKit
import SwiftUI

struct MyAccountView: View {
    @ObservedObject private var viewModel:MyAccountViewModel = .init(user: User.user)
    @State private var selectedSection: MyAccountSection?
    
    @EnvironmentObject var appManager: AppContainerManager
    
    var body: some View {
        VStack {
            List(MyAccountSection.allCases) { section in
                NavigationLink(
                    destination: destinationView(for: section),
                    tag: section,
                    selection: $selectedSection
                ) {
                    HStack {
                        Text(viewModel.sectionTitle(for: section))
                            .font(Theme.fonts.caption1)
                            .foregroundColor(viewModel.primaryColor)
                    }
                }
                .onAppear {
                    viewModel.updateColors(for: appManager)
                }
                .onChange(of: appManager.isDarkMode) { newColorScheme in
                    viewModel.updateColors(for: appManager)
                }
                .preferredColorScheme(appManager.colorScheme)
            }
        }
    }

    func destinationView(for section: MyAccountSection) -> some View {
        let title = viewModel.sectionTitle(for: section)
        let underConstruction = UnderConstructionView()
            .navigationTitle(title)
            .customBackButton()
        
        switch section {
        case .profile:
            // Navigate to Profile View
            debugPrint("Profile selected")
            let view = ProfileView(user: viewModel.user)
                .navigationTitle(title)
                .customBackButton()
            return AnyView(view)
            
        case .settings:
            // Navigate to Settings View
            debugPrint("Settings selected")
            let view = SettingsView()
                .navigationTitle(title)
                .customBackButton()
                .environmentObject(appManager)
//                .environmentObject(_colorSchemeManager)
//                .environment(colorSchemeManager)
            return AnyView(view)
        case .language:
            // Navigate to Language View
            debugPrint("Language selected")
            return AnyView(underConstruction)
        case .notifications:
            // Navigate to Notifications View
            debugPrint("Notifications selected")
            return AnyView(underConstruction)
        case .aboutFoodApp:
            // Navigate to About Food App View
            debugPrint("About Food App selected")
            return AnyView(underConstruction)
        case .termsAndConditions:
            // Navigate to Terms and Conditions View
            debugPrint("Terms and Conditions selected")
            return AnyView(underConstruction)
        case .privacyPolicy:
            // Navigate to Privacy Policy View
            debugPrint("Privacy Policy selected")
            return AnyView(underConstruction)
        case .appTips:
            // Navigate to App Tips View
            debugPrint("App Tips selected")
            return AnyView(underConstruction)
        case .shareThisApp:
            // Share the app
            debugPrint("Share This App selected")
            return AnyView(underConstruction)
        case .delete:
            // Handle account deletion
            debugPrint("Delete Account selected")
            return AnyView(underConstruction)
        case .logout:
            // Handle logout
            Theme.sessionManager.clearSession()
            debugPrint("Logout selected")
            return AnyView(underConstruction)
        }
    }
    
}
