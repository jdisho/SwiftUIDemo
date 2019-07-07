//
//  CategoryRow.swift
//  SwiftUIDemo
//
//  Created by Joan Disho on 07.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import SwiftUI

struct CategoryRow : View {
    let title: String
    let landmarks: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.title)
                .font(.headline)
                .padding(.top, 16)
                .padding(.leading, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 8) {
                    ForEach(self.landmarks) { landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                             CategoryItem(landmark: landmark)
                        }
                    }
                    .padding(.leading, 16)
                }
            }
        }
    }
}

