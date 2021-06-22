//
//  File.swift
//  
//
//  Created by Felipe Espinoza on 18/06/2021.
//

import SwiftUI

public class Config {
    /// Required initalization for the project.
    /// This method also allows to customize values like the `ImageClient`
    /// instance used by `CustomAsyncImage`
    ///
    /// - Parameter imageClient: client that performs the load of images is `CustomAsyncImage`
    public static func setup(imageClient: ImageClient? = nil) {
        SATSFont.registerCustomFonts()

        _imageClient = imageClient
    }

    // MARK: Internal properties

    static var imageClient: ImageClient {
        _imageClient ?? _defaultImageClient
    }

    // MARK: Private properties

    private static var _imageClient: ImageClient?
    private static let _defaultImageClient: ImageClient = DefaultImageClient()
}
