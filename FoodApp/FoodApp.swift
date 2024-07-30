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
    @ObservedObject private var appManager = AppContainerManager()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(.appPrimary)]
        appearance.titleTextAttributes = [.foregroundColor: UIColor(.appPrimary)]
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
                            .environmentObject(appManager)
                    } else {
                        if Theme.sessionManager.userProfile != nil {
                            TabBarController(tabs: TabViewType.allCases.map { viewType in
                                TabBarController.TabItem(viewType: viewType)
                            })
                            .environmentObject(appManager)
                        }else {
                            LoginView()
                                .environmentObject(appManager)
                        }
                    }
                }
            }
        }
    }
}
