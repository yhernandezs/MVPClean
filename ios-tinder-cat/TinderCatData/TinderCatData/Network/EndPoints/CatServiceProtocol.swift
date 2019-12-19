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
    func getCats() -> Observable<[APICat]>

}
class CatService: CatServiceProtocol {

    let cstAPIClient: ClientProtocol

    init(cstAPIClient: ClientProtocol) {
        self.cstAPIClient = cstAPIClient
    }
    func getCats() -> Observable<[APICat]> {

        return cstAPIClient.request(Endpoint<[APICat]>(method: HTTPMethod.get, relativePath: "Cats", authorizationType: APIAuthorizationType.none))
        
    }
}
