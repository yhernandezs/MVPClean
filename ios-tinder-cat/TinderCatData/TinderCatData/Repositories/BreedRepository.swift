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

class BreedRepository: BreedRepositoryType {
    
    private let breedServiceType: BreedServiceType
    
    init(breedServiceType: BreedServiceType) {
         self.breedServiceType = breedServiceType
     }
    func getBreeds() -> Observable<[Breed]> {
        return breedServiceType.getBreeds()
        .map({ apiBreeds in
            var breeds: [Breed] = []

            try apiBreeds.forEach({ apiBreeds in
                breeds.append(try APIBreedWrapper.map(apiBreeds))
            })

            return breeds
        })
        
    }
}
