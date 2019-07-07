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

    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted().identified(by: \.self)) { key in
                    Text(key)
                }
            }
            .navigationBarTitle(Text("Featured"))
        }
    }
}

#if DEBUG
struct Home_Previews : PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
