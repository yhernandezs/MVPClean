//
//  Module.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 12/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//
import UIKit
import Foundation
import TinderCatCore
import TinderCatData

protocol Module {

    var repositoryModule: RepositoryModule { get set }
    var helperModule: HelperModule { get set }
    var interactorModule: InteractorModule { get set }

    func inject(viewController: UIViewController)
}

class AbstractModule: Module {
    
    struct InputDependencies {
        let helperModule: HelperModule
        let repositoryModule: RepositoryModule
        let interactorModule: InteractorModule
    }

    var repositoryModule: RepositoryModule
    var helperModule: HelperModule
    var interactorModule: InteractorModule

    init(dependencies: InputDependencies) {
        self.helperModule = dependencies.helperModule
        self.repositoryModule = dependencies.repositoryModule
        self.interactorModule = dependencies.interactorModule
    }

    func inject(viewController: UIViewController) {

    }
}
