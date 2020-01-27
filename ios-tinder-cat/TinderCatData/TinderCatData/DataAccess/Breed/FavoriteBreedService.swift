//
//  FavoriteBreedService.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 26/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import RxSwift

protocol FavoriteBreedServiceType {
    func storeFavorite(_ breed: FavoriteDao)
    func getFavorite() -> Observable<[FavoriteDao]>
}

class FavoriteBreedService: FavoriteBreedServiceType {

    let services = BaseDataAccess()

    func storeFavorite(_ breed: FavoriteDao) {
        services.save(breed: breed)
    }

    func getFavorite() -> Observable<[FavoriteDao]> {

        return Observable<[FavoriteDao]>.create { observer in

            let favoriteList = self.services.fetch().map { (favorite) -> FavoriteDao in
                return FavoriteDao(image: favorite.image, name: favorite.name)
            }
            observer.onNext(favoriteList)
            return Disposables.create()
        }
    }
}
