//
//  MockTabView.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI

struct MockTabView: View {
    var text:String
    init(text: String) {
        self.text = text
    }
    var body: some View {
        Text(text)
        ScrollView{
            MockVerticalListView()
        }
    }
}
