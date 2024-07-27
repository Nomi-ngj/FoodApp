//
//  UnderConstructionView.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct UnderConstructionView: View {
    var message: String = "This feature is under construction"
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ZStack {
            // Background color
            (colorScheme == .dark ? Theme.color.blackColor:Theme.color.whiteColor)
                .edgesIgnoringSafeArea(.all)
            
            // Content
            VStack(spacing: 20) {
                // Warning Icon
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.yellow)
                    .frame(width: 100, height: 100)
                
                // Message
                Text(message)
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor((colorScheme == .light ? Theme.color.blackColor:Theme.color.whiteColor))
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}
