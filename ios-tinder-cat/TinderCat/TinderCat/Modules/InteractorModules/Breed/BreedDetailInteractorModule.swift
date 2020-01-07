//
//  CatDetailInteractorModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 20/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

protocol BreedDetailInteractorModule {
    var getBreedDetailInteractor: ObservableInteractor<BreedDetail, String> { get }
}

extension InteractorModule: BreedDetailInteractorModule{
    var getBreedDetailInteractor: ObservableInteractor<BreedDetail, String> {
        return GetBreedDetailInteractor(breedRepository: repositoryModule.catsRepository)
        
    }
}
