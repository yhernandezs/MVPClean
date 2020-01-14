//
//  GetBreedDetailInteractor.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 23/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//
import RxSwift
import Foundation

public class GetBreedDetailInteractor: ObservableInteractor<BreedDetail,String> {

    private let breedRepository: BreedRepositoryType
    private var breeds: BreedDetail?

    public init(breedRepository: BreedRepositoryType) {
        self.breedRepository = breedRepository
    }
    
    override public func buildUseCase(params: String) -> Observable<BreedDetail> {
        return breedRepository.getBreedDetail(params).do(onNext: { breed in
            self.breeds = breed
        }).catchError({ error in
            if let breedDetail = self.breeds {
                return Observable.just(breedDetail)
            } else {
                throw error
            }
        })
    }
}


