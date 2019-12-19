//
//  GetCatInteractor.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 13/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import RxSwift
import Foundation

public class GetCatInteractor: ObservableInteractor<[Cat], Any?> {
    
    private let catRepository: CatRepositoryProtocol
    private var cats: [Cat]?

    public init(catRepository: CatRepositoryProtocol) {
        self.catRepository = catRepository
    }

    override public func buildUseCase(params: Any?) -> Observable<[Cat]> {
        return catRepository.getCats().do(onNext: { cats in
            self.cats = cats
        }).catchError({ error in
            if let cats = self.cats {
                return Observable.just(cats)
            } else {
                throw error
            }
        })
    }
}
