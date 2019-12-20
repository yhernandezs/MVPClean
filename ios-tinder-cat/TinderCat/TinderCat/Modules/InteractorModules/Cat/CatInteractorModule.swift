//
//  CatInteractorModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 16/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

protocol CatInteractorModule {
    var getCatsInteractor: ObservableInteractor<[Breed], Any?> { get }
}

extension InteractorModule: CatInteractorModule {
    var getCatsInteractor: ObservableInteractor<[Breed], Any?> {
        return GetCatInteractor(catRepository: repositoryModule.catsRepository)
    }
    

}
