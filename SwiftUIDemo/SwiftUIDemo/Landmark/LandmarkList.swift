//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by Joan Disho on 07.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    @State private var showFavoritesOnly: Bool = false

    private let landmarks: [Landmark] = DataService.load(.landmarks)

    var body: some View {
        List {
            Toggle(isOn: $showFavoritesOnly) {
                Text("Show only favorites")
            }
            ForEach(landmarks) { landmark in
                if !self.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle("Landmarks")

    }
}
