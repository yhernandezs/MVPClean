//
//  BreedDetail.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 20/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
public struct BreedDetail: Codable {
    public let breeds: [Breed]
    public let id: String
    public let url: String
    public let width, height: Int
}
