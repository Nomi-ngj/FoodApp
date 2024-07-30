//
//  AppContainerManager.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 30/07/2024.
//

import SwiftUI
import Combine

class AppContainerManager: ObservableObject {
    @Published var isDarkMode: Bool = true
    
    var colorScheme: ColorScheme {
        return isDarkMode ? .dark : .light
    }
}
