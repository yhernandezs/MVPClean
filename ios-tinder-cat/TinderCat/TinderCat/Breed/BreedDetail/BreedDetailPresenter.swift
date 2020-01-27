//
//  BreedDetailPresenter.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 23/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
import RxSwift
import TinderCatCore

class BreesDetailPresenter: BasePresenter {

    private var breed: BreedDetail?

    private let breedInteractor: ObservableInteractor<BreedDetail, String>
    private let interactor: CompletableInteractor<BreedDetail?>
    internal let disposeBag = DisposeBag()

    required init(
        breedInteractor: ObservableInteractor<BreedDetail, String>,
        interactor: CompletableInteractor<BreedDetail?>) {

        self.breedInteractor = breedInteractor
        self.interactor = interactor
        super.init()
    }

    private var ownView: BreedDetailViewType! {
        return self.view as? BreedDetailViewType
    }

    override func unBind() {
        super.unBind()
    }
}

extension BreesDetailPresenter: BreedDetailPresenterType {

    func addToFavorite() {
        guard let breed = self.breed else { return }

        interactor.execute(params: breed, onSuccess: { [weak ownView] breedDeyail in

            print(breedDeyail)
        }) { [weak ownView] error in
            ownView?.hideConnectivityError()
            print(error)
        }.disposed(by: disposeBag)
    }

    func showTinder() {
        ownView.showTinderController()
    }

    func getBreed(_ id: String) {

        breedInteractor.execute(params: id, onSuccess: { [weak ownView] breedDeyail in

            self.breed = breedDeyail
            ownView?.displayBreed(breedDeyail)
        }) { [weak ownView] error in
            ownView?.hideConnectivityError()
            print(error)
        }.disposed(by: disposeBag)
    }
}
