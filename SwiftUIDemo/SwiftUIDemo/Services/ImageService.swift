//
//  ImageService.swift
//  PaprSwiftUI
//
//  Created by Joan Disho on 06.07.19.
//  Copyright © 2019 disho. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

final class ImageService {
    private typealias _ImageDictionary = [String: [Int: CGImage]]
    private var images: _ImageDictionary = [:]

    private static var originalSize = 250
    private static var scale = 1

    static var shared = ImageService()

    func image(name: String, size: Int) -> Image {
        let index = _guaranteeInitialImage(name: name)

        let sizedImage = images.values[index][size]
            ?? _sizeImage(images.values[index][ImageService.originalSize]!, to: size * ImageService.scale)
        images.values[index][size] = sizedImage

        return Image(sizedImage, scale: Length(ImageService.scale), label: Text(verbatim: name))
    }

    private func _guaranteeInitialImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }

        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
            else {
                fatalError("Couldn't load image \(name).jpg from main bundle.")
        }

        images[name] = [ImageService.originalSize: image]
        return images.index(forKey: name)!
    }

    private func _sizeImage(_ image: CGImage, to size: Int) -> CGImage {
        guard
            let colorSpace = image.colorSpace,
            let context = CGContext(
                data: nil,
                width: size, height: size,
                bitsPerComponent: image.bitsPerComponent,
                bytesPerRow: image.bytesPerRow,
                space: colorSpace,
                bitmapInfo: image.bitmapInfo.rawValue)
            else {
                fatalError("Couldn't create graphics context.")
        }
        context.interpolationQuality = .high
        context.draw(image, in: CGRect(x: 0, y: 0, width: size, height: size))

        if let sizedImage = context.makeImage() {
            return sizedImage
        } else {
            fatalError("Couldn't resize image.")
        }
    }
}

