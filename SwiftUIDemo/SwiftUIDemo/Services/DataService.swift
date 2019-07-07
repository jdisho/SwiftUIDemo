//
//  DataService.swift
//  PaprSwiftUI
//
//  Created by Joan Disho on 06.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import Foundation

final class DataService {

    enum File: String {
        case landmarks = "landmarks.json"
    }

    static func load<T: Decodable>(_ file: File, as type: T.Type = T.self) -> T {
        let data: Data

        guard let fileURL = Bundle.main.url(forResource: file.rawValue, withExtension: nil) else {
            fatalError("Couldn't find \(file.rawValue) in main bundle.")
        }

        do {
            data = try Data(contentsOf: fileURL)
        } catch {
            fatalError("Couldn't load \(file.rawValue) from main bundle:\n\(error)")
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(file.rawValue) as \(T.self):\n\(error)")
        }
    }
}
