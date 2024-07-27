//
//  MyAccountViewModel.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

class MyAccountViewModel: ObservableObject {
    @Published var primaryColor: Color
    @Published var user: User
    @Published var isLogout: Bool = false
    
    init(colorScheme: ColorScheme, user: User) {
        self.user = user
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
    }
    
    func updateColors(for colorScheme: ColorScheme) {
        // Update colors based on the new color scheme
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
    }
    
    func sectionTitle(for section: MyAccountSection) -> String {
        switch section {
        case .profile: return Theme.localized.profile
        case .settings: return Theme.localized.settings
        case .language: return Theme.localized.language
        case .notifications: return Theme.localized.notifications
        case .aboutFoodApp: return Theme.localized.aboutFoodApp
        case .termsAndConditions: return Theme.localized.termsAndConditions
        case .privacyPolicy: return Theme.localized.privacyPolicy
        case .appTips: return Theme.localized.appTips
        case .shareThisApp: return Theme.localized.shareThisApp
        case .delete: return Theme.localized.delete
        case .logout: return Theme.localized.logout
        }
    }
    
    func destinationView(for section: MyAccountSection) -> some View {
        let underConstruction = UnderConstructionView()
            .navigationTitle(sectionTitle(for: section))
            .customBackButton()
        
        switch section {
        case .profile:
            // Navigate to Profile View
            debugPrint("Profile selected")
            let view = ProfileView(user: user)
                .navigationTitle(sectionTitle(for: section))
                .customBackButton()
            return AnyView(view)
            
        case .settings:
            // Navigate to Settings View
            debugPrint("Settings selected")
            return AnyView(underConstruction)
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
    
    func logout() {
        isLogout.toggle()
    }
}
