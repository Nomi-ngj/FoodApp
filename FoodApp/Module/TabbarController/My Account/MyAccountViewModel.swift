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

    init(user: User)//,
         //colorSchemeManager: EnvironmentObject<ColorSchemeManager>)
    {
        self.user = user
        self.primaryColor = Theme.color.primaryColor
       // self.primaryColor = _colorSchemeManager.wrappedValue.colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
    }
    
    func updateColors(for colorSchemeManager: AppContainerManager) {
        // Update colors based on the new color scheme
        self.primaryColor = colorSchemeManager.isDarkMode == true ? Theme.color.whiteColor : Theme.color.primaryColor
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
    
    func logout() {
        isLogout.toggle()
    }
}
