//
//  FavoriteBreed.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 27/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation

public struct FavoriteBreed: Codable {
    public let image: String
    public let name: String
    
    public init(image: String, name: String) {
        self.image = image
        self.name = name
    }
}

