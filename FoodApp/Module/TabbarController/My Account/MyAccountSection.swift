//
//  MyAccountSection.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import Foundation

enum MyAccountSection: String, CaseIterable, Identifiable {
    case profile
    case settings
    case language
    case notifications
    case aboutFoodApp
    case termsAndConditions
    case privacyPolicy
    case appTips
    case shareThisApp
    case delete
    case logout
    
    var id: String { rawValue }
}
