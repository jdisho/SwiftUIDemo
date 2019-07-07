//
//  LandmarkDetail.swift
//  SwiftUIDemo
//
//  Created by Joan Disho on 07.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
    let landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            ImageService.shared.image(name: landmark.imageName, size: Int(UIScreen.main.bounds.width))
                .padding(.vertical)

            VStack {
                HStack {
                    Text(verbatim: landmark.name)
                        .font(.title)
                    Spacer()
                    Image(systemName: landmark.isFavorite ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                }
                .padding(.horizontal)

                HStack {
                    Text(verbatim: landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(verbatim: landmark.state)
                        .font(.subheadline)
                        .bold()
                        .padding(4.0)
                        .background(Color.gray)
                        .cornerRadius(4.0)
                }
                .padding(.horizontal)

            }
            Spacer()
        }
    }
}
