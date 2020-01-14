//
//  BreedDetail.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 20/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
public struct BreedDetail: Codable {
    public let id: String
    public let name: String
    public let description: String

    public init(id: String, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
       
    }
}
