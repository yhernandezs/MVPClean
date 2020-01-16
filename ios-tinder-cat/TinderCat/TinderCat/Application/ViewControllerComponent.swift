//
//  ViewControllerComponent.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 17/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
import TinderCatData

class ViewControllerComponent {

    private let helperModule: HelperModule
    private let repositoryModule: RepositoryModule
    private let interactorModule: InteractorModule
    private let presenterModule: PresenterModule
    var modules: [String: AbstractModule] = [String: AbstractModule]()
    func repositoryModel() -> RepositoryModule {
        return repositoryModule
    }
    init() {
        self.helperModule = HelperModule()
        self.repositoryModule = RepositoryModule()
        self.interactorModule = InteractorModule(repositoryModule: repositoryModule,
                                                 helperModule: helperModule)
        self.presenterModule = PresenterModule(interactorModule: interactorModule)
        
        let dependencies = AbstractModule.InputDependencies(helperModule: helperModule,
                   repositoryModule: repositoryModule,
                   interactorModule: interactorModule)
        modules[NSStringFromClass(BreedViewController.self.classForCoder())] = BreedModule(dependencies: dependencies)
        modules[NSStringFromClass(BreedDetailViewController.self.classForCoder())] = BreedDetailModule(dependencies: dependencies)



    }

}
