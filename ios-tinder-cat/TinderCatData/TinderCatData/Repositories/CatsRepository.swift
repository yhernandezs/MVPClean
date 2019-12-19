//
//  CatsRepository.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 13/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
import RxSwift

class CatsRepository: CatRepositoryProtocol {
    
    private let catServiceProtocol: CatServiceProtocol
    
    init(catServiceProtocol: CatServiceProtocol) {
         self.catServiceProtocol = catServiceProtocol
     }
    func getCats() -> Observable<[Cat]> {
        return catServiceProtocol.getCats()
        .map({ apiCats in
            var cats: [Cat] = []

            try apiCats.forEach({ apiCats in
                cats.append(try APICatWrapper.map(apiCats))
            })

            return cats
        })
        
    }
}
