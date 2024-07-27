//
//  TabBarController.swift
//
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI

class TabBarViewModel: ObservableObject{
    
    @Published var selectionColor:Color = Theme.color.primaryColor
    @Binding var showTopBar:Bool
    let unSelectionColor = Theme.color.disabledColor
    let fontLabel:Font = Theme.fonts.caption4
    
    init(colorScheme: ColorScheme, showTopBar:Binding<Bool>) {
        self.selectionColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
        _showTopBar = showTopBar
    }
    
    func updateColors(for colorScheme: ColorScheme) {
        // Update colors based on the new color scheme
        self.selectionColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
    }
    
}

struct TabBarController: View {
    
    struct TabItem {
        var viewType: TabViewType
    }
    @ObservedObject var viewModel:TabBarViewModel = .init(colorScheme: .light, showTopBar: .constant(false))
    @State private var selectedTab: TabViewType
    @State private var tabOpacity = 0.0
    @Environment(\.colorScheme) private var colorScheme
    
    let tabs: [TabItem]
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
            MyAccountView(viewModel: .init(colorScheme: .light, user: User.user))
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
                            if viewModel.showTopBar {
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
                                Text(tab.viewType.title)
                                    .font(viewModel.fontLabel)
                            }
                        }
                        .foregroundColor((tab.viewType == selectedTab ? viewModel.selectionColor : viewModel.unSelectionColor))
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
                // Update ViewModel when the view appears
                viewModel.updateColors(for: colorScheme)
            }
            .onChange(of: colorScheme) { newColorScheme in
                // Update ViewModel when the color scheme changes
                viewModel.updateColors(for: newColorScheme)
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
