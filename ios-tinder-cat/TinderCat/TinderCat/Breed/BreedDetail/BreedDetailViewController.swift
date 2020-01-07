//
//  BreedDetailViewController.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 23/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore

public protocol BreedDetailViewControllerDelegate: class {
    func navigateToFirstPage()
    func navigateToThirdPage()
}

class BreedDetailViewController: BaseViewController {
    public weak var delegate: BreedDetailViewControllerDelegate?


    private var innerPresenter: BreedDetailPresenterType! {
        return self.presenter as? BreedDetailPresenterType
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.innerPresenter.bind(withView: self)
        self.innerPresenter.getBreed("beng")

    }
    override func initializeComponents() {

    }
    override func setupViews() {

    }

    override func setConstraints() {


    }
    
}

extension BreedDetailViewController: BreedDetailViewType{
    func displayBreed(_ breed: BreedDetail) {
        
    }
}
