//
//  LandmarkRow.swift
//  SwiftUIDemo
//
//  Created by Joan Disho on 07.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {
    let landmark: Landmark
    
    var body: some View {
        HStack {
            ImageService.shared.image(name: landmark.imageName, size: 50)
            Text(verbatim: landmark.name)
            Spacer()
            Image(systemName: landmark.isFavorite ? "star.fill" : "star").foregroundColor(.yellow).padding()
        }
    }
}
