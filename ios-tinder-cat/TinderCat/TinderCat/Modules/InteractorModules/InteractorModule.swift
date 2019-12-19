//
//  InteractorModule.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 13/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatData
import TinderCatCore

public class InteractorModule {
    internal let repositoryModule: RepositoryModule

    init(repositoryModule: RepositoryModule,
        helperModule: HelperModule) {
        self.repositoryModule = repositoryModule
    }

    //lazy var getCatsInteractor: ObservableInteractor<[CatResponse], Any?> = {
      //  return GetCatInteractor(catRepository: repositoryModule.catsRepository)
    //}()

}
