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

class CatPresenter: BasePresenter {

    private var cats: [Cat]?

    private let catInteractor: ObservableInteractor<[Cat], Any?>
    internal let disposeBag = DisposeBag()

    required init(catInteractor: ObservableInteractor<[Cat], Any?>) {
        self.catInteractor = catInteractor
    }

    private var ownView: CatViewType! {
        return self.view as? CatViewType
    }

    override func unBind() {
        super.unBind()
    }
}

extension CatPresenter: CatPresenterType {
    func showDetail(_ cat: Cat) {
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
