//
//  FavoriteBreedRepository.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 20/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
import RxSwift

class FavoriteBreedRepository: FavoriteBreedRepositoryType {
    
    private let breedTransactionType: BreedTransactionType

    init(breedTransactionType: BreedTransactionType) {
        self.breedTransactionType = breedTransactionType
    }
    
    func storeFavorite(_ breed: Breed) {
        
    }
    
    func getFavorite() -> Observable<[Breed]> {
        return breedTransactionType.getFavorite()
        .map({ apiBreeds in
            var breeds: [Breed] = []

            try apiBreeds.forEach({ apiBreeds in
                breeds.append(try APIBreedWrapper.map(apiBreeds))
            })

            return breeds
        })
    }

}
