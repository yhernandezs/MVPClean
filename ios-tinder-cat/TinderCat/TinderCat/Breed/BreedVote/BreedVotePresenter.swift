//
//  BreedVotePresenter.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 27/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
import RxSwift

class BreedVotePresenter: BasePresenter {

    private var favorites: [FavoriteBreed] = []

    private let favoriteBreedInteractor: ObservableInteractor<[FavoriteBreed], Any?>

    internal let disposeBag = DisposeBag()

    required init(favoriteBreedInteractor: ObservableInteractor<[FavoriteBreed], Any?>) {
        self.favoriteBreedInteractor = favoriteBreedInteractor
    }

    private var ownView: BreedVoteViewType! {
        return self.view as? BreedVoteViewType
    }

    override func unBind() {
        super.unBind()
    }
}

extension BreedVotePresenter: BreedVotePresenterType{
    func getFovoriteBreed() {
        favoriteBreedInteractor.execute(params: nil, onSuccess: { [weak ownView] favorites in

            ownView?.displayFavoriteBreed(breeds: favorites)
        }) { [weak ownView] error in
            ownView?.hideProgress()
            //self?.handleException(error: error)
        }.disposed(by: disposeBag)

    }
}
