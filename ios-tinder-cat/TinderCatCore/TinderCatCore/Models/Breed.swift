//
//  Cat.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 13/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation

public struct Breed: Codable {
    public var id: String
    public var name: String

    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
