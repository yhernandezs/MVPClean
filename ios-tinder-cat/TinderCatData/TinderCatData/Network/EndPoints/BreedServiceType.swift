//
//  CatServiceProtocol.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 12/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import RxSwift
import Vatosawa
import Alamofire

protocol BreedServiceType {
    func getBreeds() -> Observable<[APIBreed]>
    func getBreedsDetail(with id: String) -> Observable<APIBreedDetail>
}

class BreedService: BreedServiceType {
  
    let breedAPIClient: ClientProtocol

    init(breedAPIClient: ClientProtocol) {
        self.breedAPIClient = breedAPIClient
    }

    func getBreeds() -> Observable<[APIBreed]> {
        return breedAPIClient.request(Endpoint<[APIBreed]>(
            method: HTTPMethod.get,
            relativePath: "breeds",
            authorizationType: APIAuthorizationType.none))
    }
    
    func getBreedsDetail(with id: String) -> Observable<APIBreedDetail> {
        //let breedsForIdEndPoint  = [String(format: "breeds/search%@", id)
        let relativePath  = "breeds/\(id)"

          return breedAPIClient.request(Endpoint<APIBreedDetail>(
            method: .get,
            relativePath: relativePath
          ))
      }
}
