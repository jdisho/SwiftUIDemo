//
//  Landmark.swift
//  SwiftUIDemo
//
//  Created by Joan Disho on 07.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let state: String
    let park: String
    let category: Category
    let isFavorite: Bool
    let isFeatured: Bool

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

