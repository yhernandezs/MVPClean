//
//  CatContract.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 12/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
protocol BreedViewType: BaseView {
    func dismiss()
    func showProgress()
    func hideProgress()
    func displayCats(breeds: [Breed])
    func catDetail(_ breed: Breed)
}

protocol BreedPresenterType: BasePresenterProtocol {
    func getCats()
    func showDetail(_ breed: Breed)
}
