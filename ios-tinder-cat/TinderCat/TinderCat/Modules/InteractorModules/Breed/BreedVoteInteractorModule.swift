//
//  BreedVoteInteractorModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 27/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

protocol BreedVoteInteractorModule {
    var getFavoritesInteractor: ObservableInteractor<[FavoriteBreed], Any?> { get }
}

extension InteractorModule: BreedVoteInteractorModule {
    var getFavoritesInteractor: ObservableInteractor<[FavoriteBreed], Any?> {
        return GetFavoriteBreedInteractor(breedRepository: repositoryModule.favoriteRepository)
    }
}
