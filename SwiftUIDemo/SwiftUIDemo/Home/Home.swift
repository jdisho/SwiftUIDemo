//
//  Home.swift
//  SwiftUIDemo
//
//  Created by Joan Disho on 07.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import SwiftUI

struct Home : View {
    private var categories: [String: [Landmark]] {
        let landmarks: [Landmark] = DataService.load(.landmarks)
        return .init(grouping: landmarks, by: { $0.category.rawValue })
    }

    private var featuredLandmarks: [Landmark] {
        let landmarks: [Landmark] = DataService.load(.landmarks)
        return landmarks.filter { $0.isFeatured }
    }

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LandmarkList()) {
                    Text("See All")
                }
                
                FeaturedLandmarks(landmarks: featuredLandmarks)
                    .scaledToFit()
                    .listRowInsets(EdgeInsets())

                ForEach(categories.keys.sorted().identified(by: \.self)) { key in
                    CategoryRow(title: key, landmarks: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle("Featured")
        }
    }
}
