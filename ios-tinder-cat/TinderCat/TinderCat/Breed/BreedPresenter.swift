//
//  CatPresenter.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 10/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
import RxSwift

class BreedPresenter: BasePresenter {

    private var cats: [Breed]?

    private let catInteractor: ObservableInteractor<[Breed], Any?>
    internal let disposeBag = DisposeBag()

    required init(catInteractor: ObservableInteractor<[Breed], Any?>) {
        self.catInteractor = catInteractor
    }

    private var ownView: BreedViewType! {
        return self.view as? BreedViewType
    }

    override func unBind() {
        super.unBind()
    }
}

extension BreedPresenter: BreedPresenterType {
    func showDetail(_ cat: Breed) {
        ownView.catDetail(cat)
    }
    
    func getCats() {
        catInteractor.execute(params: nil, onSuccess: { [weak ownView] cats in
            ownView?.displayCats(cats: cats)
        }) { [weak ownView] error in
            ownView?.hideProgress()
            //self?.handleException(error: error)
        }.disposed(by: disposeBag)
    }

}
