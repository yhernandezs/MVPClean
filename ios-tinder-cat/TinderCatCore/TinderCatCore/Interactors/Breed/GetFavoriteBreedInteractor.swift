//
//  GetFavoriteBreedInteractor.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 20/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import RxSwift

public class GetFavoriteBreedInteractor: ObservableInteractor<[Breed], Any?> {

    private let breedRepository: FavoriteBreedRepositoryType
    private var breeds: [Breed]?

    public init(breedRepository: FavoriteBreedRepositoryType) {
        self.breedRepository = breedRepository
    }

    override public func buildUseCase(params: Any?) -> Observable<[Breed]> {
        return breedRepository.getFavorite().do(onNext: { favorites in
            self.breeds = favorites
        }).catchError({ error in
            if let favorites = self.breeds {
                return Observable.just(favorites)
            } else {
                throw error
            }
        })
    }

}
