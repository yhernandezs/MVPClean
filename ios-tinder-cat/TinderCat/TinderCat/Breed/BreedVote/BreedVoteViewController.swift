//
//  BreedVoteViewController.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 20/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import Foundation
import UIKit
import TinderCatCore

class BreedVoteViewController: BaseViewController {

    public weak var delegate: NavigateToNextController?
    var viewModelData = [FavoriteBreed]()
    var stackContainer: StackContainerView!

    private var innerPresenter: BreedVotePresenterType! {
        return self.presenter as? BreedVotePresenterType
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.innerPresenter.bind(withView: self)
        self.innerPresenter.getFovoriteBreed()

    }

    override func initializeComponents() {

    }

    override func setupViews() {
        view = UIView()
        view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
        stackContainer = StackContainerView()
        view.addSubview(stackContainer)
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        configureNavigationBarButtonItem()

    }

    override func setConstraints() {
        stackContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60).isActive = true
        stackContainer.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackContainer.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    func configureNavigationBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetTapped))
    }
    //MARK: - Handlers
    @objc func resetTapped() {
        stackContainer.reloadData()
    }


}

extension BreedVoteViewController: SwipeCardsDataSource {

    func numberOfCardsToShow() -> Int {
        return viewModelData.count
    }

    func card(at index: Int) -> SwipeCardView {
        let card = SwipeCardView()
        card.dataSource = viewModelData[index]
        return card
    }

    func emptyView() -> UIView? {
        return nil
    }

}

extension BreedVoteViewController: BreedVoteViewType {
    func dismiss() {

    }

    func showProgress() {

    }

    func hideProgress() {

    }

    func displayFavoriteBreed(breeds: [FavoriteBreed]) {
        DispatchQueue.main.async {

            self.viewModelData = breeds
            self.stackContainer.dataSource = self
        }
    }

}


