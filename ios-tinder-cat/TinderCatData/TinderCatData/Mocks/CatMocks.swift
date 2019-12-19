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

    func getCats() -> [Cat] {

        let cats = [Cat(id: "1", name: "Criollito 1"),
                    Cat(id: "2", name: "Criollito 2"),
                    Cat(id: "3", name: "Criollito 3"),
                    Cat(id: "4", name: "Criollito 4")
        ]

        return cats
    }
}
