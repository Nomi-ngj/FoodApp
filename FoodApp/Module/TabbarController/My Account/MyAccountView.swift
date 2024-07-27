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
    @ObservedObject private var viewModel:MyAccountViewModel
    @State private var selectedSection: MyAccountSection?
    
    @Environment(\.colorScheme) private var colorScheme
    
    init(viewModel:MyAccountViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            List(MyAccountSection.allCases) { section in
                NavigationLink(
                    destination: viewModel.destinationView(for: section),
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
                    // Update ViewModel when the view appears
                    viewModel.updateColors(for: colorScheme)
                }
                .onChange(of: colorScheme) { newColorScheme in
                    // Update ViewModel when the color scheme changes
                    viewModel.updateColors(for: newColorScheme)
                }
            }
        }
        .navigationTitle(Theme.localized.myAccount)
    }

}
