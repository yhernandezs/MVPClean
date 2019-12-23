//
//  CatsRepositoryProtocol.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 13/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import RxSwift

public protocol BreedRepositoryType {
    func getBreeds() -> Observable<[Breed]>
}
