//
//  ProfileImage.swift
//  FoodApp
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct ProfileImage: View {
    
    let urlString:String
    let height:Double = 300
    let width: Double = 300
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        VStack(alignment: .center) {
            if let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: width, height: height)
                } placeholder: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: width, height: height)
                        .foregroundColor(.gray)
                }
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: width, height: height)
                    .foregroundColor(.gray)
            }
        }
    }
}
