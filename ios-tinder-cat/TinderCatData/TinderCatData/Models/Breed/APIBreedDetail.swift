//
//  APIBreedDetail.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 20/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
struct APIBreedDetail: Codable {
    let breeds: [APIBreed]
    let id: String
    let url: String
    let width, height: Int
}
