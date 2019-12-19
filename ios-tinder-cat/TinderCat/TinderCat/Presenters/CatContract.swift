//
//  CatContract.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 12/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
protocol CatViewType: BaseView {
    func dismiss()
    func showProgress()
    func hideProgress()
    func displayCats(cats: [Cat])
    func catDetail(_ cat: Cat)

}

protocol CatPresenterType: BasePresenterProtocol {
    func getCats()
    func showDetail(_ cat: Cat)
}
