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

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashScreenView(showSplash: $showSplash)
                } else {
                    TabBarController(tabs: TabViewType.allCases.map { viewType in
                        TabBarController.TabItem(viewType: viewType)
                    })
                }
            }
        }
    }
}
