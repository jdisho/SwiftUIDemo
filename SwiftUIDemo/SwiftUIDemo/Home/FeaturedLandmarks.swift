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
        ImageService.shared.image(name: landmarks[0].imageName, size: 250).resizable()
    }
}
