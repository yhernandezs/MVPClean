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
    
    private let favoriteBreedServiceType: FavoriteBreedServiceType
    let services = FavoriteBreedService()

    init(favoriteBreedServiceType: FavoriteBreedServiceType) {
        self.favoriteBreedServiceType = favoriteBreedServiceType
    }
    func storeFavorite(_ breed: FavoriteBreed) {
        let favoriteDao = FavoriteDao(image: breed.image, name: breed.name)
        services.storeFavorite(favoriteDao)
    }
    
    func getFavorite() -> Observable<[FavoriteBreed]> {
        return favoriteBreedServiceType.getFavorite()
        .map({ apiBreeds in
            var breeds: [FavoriteBreed] = []

            try apiBreeds.forEach({ apiBreeds in
                breeds.append(try APIBreedWrapper.map(apiBreeds))
            })

            return breeds
        })
    }

}
