//
//  FoodAppApp.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI

@main
struct FoodAppApp: App {
    @State private var showSplash = true
    
    init() {
        
        let appearance = UINavigationBarAppearance()
        
        // Set the back button text color
        appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(.appPrimary)]
        
        // Set the title color
        appearance.titleTextAttributes = [.foregroundColor: UIColor(.appPrimary)]
        
        // Apply the appearance settings to the navigation bar
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        
    }
       
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView{
                    if showSplash {
                        SplashScreenView(showSplash: $showSplash)
                    } else {
                        if Theme.sessionManager.userProfile != nil {
                            TabBarController(tabs: TabViewType.allCases.map { viewType in
                                TabBarController.TabItem(viewType: viewType)
                            })
                        }else {
                            LoginView()
                        }
                    }
                }
            }
        }
    }
}
