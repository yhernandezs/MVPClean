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

protocol CatServiceProtocol {
    func getCats() -> Observable<[APIBreed]>
    func getCatsDetail(with id: String) -> Observable<[APIBreedDetail]>

}
class CatService: CatServiceProtocol {
  
    let cstAPIClient: ClientProtocol

    init(cstAPIClient: ClientProtocol) {
        self.cstAPIClient = cstAPIClient
    }

    func getCats() -> Observable<[APIBreed]> {
        return cstAPIClient.request(Endpoint<[APIBreed]>(method: HTTPMethod.get, relativePath: "breeds", authorizationType: APIAuthorizationType.none))
    }
    
    func getCatsDetail(with id: String) -> Observable<[APIBreedDetail]> {
          return cstAPIClient.request(Endpoint<[APIBreedDetail]>(method: HTTPMethod.get, relativePath: "images/search?breed_ids=\(id)", authorizationType: APIAuthorizationType.none))
      }
}
