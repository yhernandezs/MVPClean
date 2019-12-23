//
//  GetCatInteractor.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 13/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import RxSwift
import Foundation

public class GetBreedInteractor: ObservableInteractor<[Breed], Any?> {
    
    private let breedRepository: BreedRepositoryType
    private var breeds: [Breed]?

    public init(breedRepository: BreedRepositoryType) {
        self.breedRepository = breedRepository
    }

    override public func buildUseCase(params: Any?) -> Observable<[Breed]> {
        return breedRepository.getBreeds().do(onNext: { cats in
            self.breeds = cats
        }).catchError({ error in
            if let cats = self.breeds {
                return Observable.just(cats)
            } else {
                throw error
            }
        })
    }
}
