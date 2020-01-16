//
//  PresenterModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 17/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
class PresenterModule {

    private let interactorModule: InteractorModule

    init(interactorModule: InteractorModule) {
        self.interactorModule = interactorModule
    }

    func catPresenter() -> BreedPresenterType {
        return BreedPresenter(catInteractor: interactorModule.getCatsInteractor)
    }
    func getInteractorModule() -> InteractorModule {
        return interactorModule
    }
}
