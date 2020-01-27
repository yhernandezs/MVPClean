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

    public lazy var catsRepository: BreedRepositoryType = {
        return BreedRepository(breedServiceType: self.serviceModule.catService)
    }()

    public lazy var favoriteRepository: FavoriteBreedRepositoryType = {
        return FavoriteBreedRepository(favoriteBreedServiceType: self.serviceModule.favoriteService)
    }()

}
