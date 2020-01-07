//
//  CatInteractorModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 16/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

protocol BreedInteractorModule {
    var getCatsInteractor: ObservableInteractor<[Breed], Any?> { get }
}

extension InteractorModule: BreedInteractorModule {
   
    var getCatsInteractor: ObservableInteractor<[Breed], Any?> {
        return GetBreedInteractor(breedRepository: repositoryModule.catsRepository)
    }
}
