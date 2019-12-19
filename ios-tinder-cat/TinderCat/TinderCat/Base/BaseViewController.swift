//
//  BaseViewController.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 3/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, BaseView, BaseViewType {
    func showError(error: Error) {

    }

    func showConnectivityError() {

    }

    func hideConnectivityError() {

    }


    var presenter: BasePresenterProtocol!

    func initializeComponents() {
        fatalError("This method must be implemented")
    }

    func setConstraints() {
        fatalError("This method must be implemented")

    }

    func setupViews() {
        fatalError("This method must be implemented")
    }

    deinit {
        presenter?.unBind()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ownInit()
        initializeComponents()
        setupViews()
        setConstraints()
    }

    private func ownInit() {
        self.injectDependencies()
    }

    private func injectDependencies() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let className = NSStringFromClass(self.classForCoder)

        guard let module = delegate.viewControllerComponent.modules[className] else {
            return
        }

        module.inject(viewController: self)

    }

}
