//
//  FavoriteBreedRepositoryType.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 20/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import RxSwift

public protocol FavoriteBreedRepositoryType {
    func storeFavorite(_ breed: FavoriteBreed)
    func getFavorite() -> Observable<[FavoriteBreed]>
}
