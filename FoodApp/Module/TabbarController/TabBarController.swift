//
//  TabBarController.swift
//
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI

struct TabBarController: View {
    
    struct TabItem {
        var viewType: TabViewType
    }
    
    @State private var selectedTab: TabViewType
    @State private var tabOpacity = 0.0
    @Environment(\.colorScheme) private var colorScheme
    
    let tabs: [TabItem]
    private let fontLabel:Font = Theme.fonts.caption4
    private let selectionColor = Theme.color.primaryColor
    private let unSelectionColor = Theme.color.disabledColor
    private let showTopBar = false
    init(tabs: [TabItem]) {
        self.tabs = tabs
        _selectedTab = State(initialValue: tabs.first!.viewType)
    }
    
    @ViewBuilder
    func tabView(for viewType: TabViewType) -> some View {
        switch viewType {
        case .home:
            MockTabView(text: "Home Tab Content")
        case .orders:
            MockTabView(text: "Order Tab Content")
        case .favorites:
            MockTabView(text: "Favorite Tab Content")
        case .profile:
            MockTabView(text: "Account Tab Content")
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            tabView(for: selectedTab)
                .edgesIgnoringSafeArea(.bottom)
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.viewType) { tab in
                    Button(action: {
                        withAnimation {
                            selectedTab = tab.viewType
                        }
                    }) {
                        VStack {
                            if showTopBar {
                                if tab.viewType == selectedTab {
                                    Rectangle()
                                        .frame(height: 3)
                                        .foregroundColor(.orange)
                                } else {
                                    Divider()
                                        .padding(.horizontal, 0)
                                        .opacity(0.1)
                                }
                            }
                            
                            Image(tab.viewType.imageNameActive, bundle: .main)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25, alignment: .center)
                            
                            if tab.viewType == selectedTab{
                                Text(tab.viewType.rawValue)
                                    .font(fontLabel)
                            }
                        }
                        .foregroundColor(tab.viewType == selectedTab ? selectionColor : (colorScheme == .dark ? Color.white: unSelectionColor))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .background(colorScheme == .dark ? Color.black: Color.white)
            .frame(height: 70)
            .opacity(tabOpacity)
            .onAppear {
                withAnimation(.easeIn(duration: 0.5)) {
                    tabOpacity = 1.0
                }
            }
            
        }
    }
}

#if DEBUG
#Preview{
    VStack{
        TabBarController(tabs: TabViewType.allCases.map { viewType in
            TabBarController.TabItem(viewType: viewType)
        })
    }
}
#endif
