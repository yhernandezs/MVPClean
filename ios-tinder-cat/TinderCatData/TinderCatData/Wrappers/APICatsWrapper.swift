//
//  APICatsWrapper.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 13/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

class APICatWrapper {
    static func map(_ input: APIBreed) throws -> Breed {
       
        return Breed(id: input.id, name: input.name)
    }
}
