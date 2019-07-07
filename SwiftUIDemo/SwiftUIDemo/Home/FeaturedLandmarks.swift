//
//  FeaturedLandmarks.swift
//  SwiftUIDemo
//
//  Created by Joan Disho on 07.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import SwiftUI

struct FeaturedLandmarks : View {
    let landmarks: [Landmark]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 8) {
                ForEach(landmarks) { landmark in
                    ImageService.shared.image(name: landmark.imageName, size: Int(UIScreen.main.bounds.width))
                }
            }
        }
    }
}
