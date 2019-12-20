//
//  CatService.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 19/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

class CatMocks{

    func getCats() -> [Breed] {

        let cats = [Breed(id: "1", name: "Criollito 1"),
                    Breed(id: "2", name: "Criollito 2"),
                    Breed(id: "3", name: "Criollito 3"),
                    Breed(id: "4", name: "Criollito 4")
        ]

        return cats
    }
}
