//
//  SetFavoriteBreedInteractor.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 26/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import RxSwift

public class SetFavoriteBreedInteractor: CompletableInteractor<BreedDetail?> {

    private let breedRepository: FavoriteBreedRepositoryType

    public init(breedRepository: FavoriteBreedRepositoryType) {
        self.breedRepository = breedRepository
    }

    public override func buildUseCase(params: BreedDetail?) -> Completable {
        return Completable.create(subscribe: { completable -> Disposable in
            do {
                let favorite = FavoriteBreed(image: FavoriteImage.getImage(), name: params!.name)
                self.breedRepository.storeFavorite(favorite)
                completable(CompletableEvent.completed)
            } catch let err {
                completable(CompletableEvent.error(err))
            }
            return Disposables.create()
        })
    }
}
