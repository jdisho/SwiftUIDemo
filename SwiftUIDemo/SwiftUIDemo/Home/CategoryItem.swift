//
//  CategoryItem.swift
//  SwiftUIDemo
//
//  Created by Joan Disho on 07.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import SwiftUI

struct CategoryItem : View {
    let landmark: Landmark

    var body: some View {
        VStack {
            ImageService.shared.image(name: landmark.imageName, size: 160)
                .cornerRadius(4)
            Text(landmark.name)
                .font(.caption)
                .bold()
        }
        .padding(.vertical)
    }
}
