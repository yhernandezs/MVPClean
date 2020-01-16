//
//  Coordinator.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 5/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator]{get set}
    init(navigationController: UINavigationController)
}

public protocol CoordinatorParamater: AnyObject {
    associatedtype Params
    func start(data: Params)
    func start()
}

public class BaseCoordinator<T>: Coordinator, CoordinatorParamater {
    public typealias Params = T
    public var childCoordinators: [Coordinator] = []
    
    unowned let navigationController: UINavigationController
    
    public required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start(data: Params) {}
    public func start() {}
}

protocol BackToFirstViewControllerDelegate: class {
    func navigateBackToFirstPage(newOrderCoordinator: BreedDetailCoordinator)
}

extension BaseCoordinator: BackToFirstViewControllerDelegate {
    
    func navigateBackToFirstPage(newOrderCoordinator: BreedDetailCoordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    }
}

