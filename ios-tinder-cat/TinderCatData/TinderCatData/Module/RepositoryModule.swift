//
//  RepositoryModule.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 12/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

public class RepositoryModule {
    
    public lazy var serviceModule = ServiceModule()

    public init() {
    }

    public lazy var catsRepository: CatRepositoryProtocol = {
        return CatsRepository(catServiceProtocol: self.serviceModule.catService)
    }()
    
}
