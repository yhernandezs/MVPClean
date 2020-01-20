//
//  BreedTransactionType.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 20/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import RxSwift

protocol BreedTransactionType {
    func storeFavorite(_ breed: APIBreed)
    func getFavorite() -> Observable<[APIBreed]>
}

class BreedTransaction: BreedTransactionType {

    func storeFavorite(_ breed: APIBreed) {

    }

    func getFavorite() -> Observable<[APIBreed]> {

        return Observable<[APIBreed]>.create { observer in
            let breed = APIBreed(id: "1", name: "x")
            let breed2 = APIBreed(id: "2", name: "y")
            let breeds: [APIBreed] = [breed,breed2]

            observer.onNext(breeds)
            return Disposables.create()
        }
            .subscribe(onCompleted: {
                print("completed")
            }) as! Observable<[APIBreed]>
    }
}
