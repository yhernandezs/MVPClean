//
//  ClientProtocol.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 12/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import RxSwift
import Vatosawa
import TinderCatCore

public protocol ClientProtocol {
    func request<Response>(_ endpoint: Endpoint<Response>) -> Observable<Response>
}
public class ServiceModule {

    var catAPIClient: ClientProtocol = BaseAPIClient()

    lazy var catService: BreedServiceType = {
        return BreedService(breedAPIClient: catAPIClient)
    }()

}
