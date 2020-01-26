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

class BreesDetailPresenter: BasePresenter {

    private var breed: BreedDetail?

    private let breedInteractor: ObservableInteractor<BreedDetail, String>
    
    internal let disposeBag = DisposeBag()

    required init(breedInteractor: ObservableInteractor<BreedDetail, String>) {
        self.breedInteractor = breedInteractor
    }
    
    private var ownView: BreedDetailViewType! {
        return self.view as? BreedDetailViewType
    }

    override func unBind() {
        super.unBind()
    }
}

extension BreesDetailPresenter: BreedDetailPresenterType {
    func showTinder() {
        ownView.showTinderController()
    }
    
    func getBreed(_ id: String) {

        breedInteractor.execute(params: id, onSuccess: { [weak ownView] breedDeyail in

            ownView?.displayBreed(breedDeyail)
        }) { [weak ownView] error in
            ownView?.hideConnectivityError()
            print(error)
        }.disposed(by: disposeBag)
    }
}
