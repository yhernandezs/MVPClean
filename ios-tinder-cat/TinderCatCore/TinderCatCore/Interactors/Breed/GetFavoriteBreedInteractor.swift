//
//  GetFavoriteBreedInteractor.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 20/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import RxSwift

public class GetFavoriteBreedInteractor: ObservableInteractor<[FavoriteBreed], Any?> {

    private let breedRepository: FavoriteBreedRepositoryType
    private var breeds: [FavoriteBreed]?

    public init(breedRepository: FavoriteBreedRepositoryType) {
        self.breedRepository = breedRepository
    }

    override public func buildUseCase(params: Any?) -> Observable<[FavoriteBreed]> {
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
