//
//  TabViewType.swift
//
//
//  Created by Nouman Gul Junejo on 02/08/2023.
//

import Foundation


enum TabViewType:String, CaseIterable {
    case home = "Home"
    case orders = "My Order"
    case favorites = "My Favorites"
    case profile = "My Account"
    
    var imageNameActive:String{
        switch self {
        case .home:
            return "home"
        case .orders:
            return "orders"
        case .favorites:
            return "favorite"
        case .profile:
            return "profile"
        }
    }
    
    var imageNameInactive:String{
        switch self {
        case .home:
            return "home"
        case .orders:
            return "orders"
        case .favorites:
            return "favorite"
        case .profile:
            return "profile"
        }
    }
}
