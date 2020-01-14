//
//  BreedDetailViewController.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 23/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import TinderCatCore
import UIKit

public protocol BreedDetailViewControllerDelegate: class {
    func navigateToFirstPage()
    func navigateToThirdPage()
}

class BreedDetailViewController: BaseViewController {
    private var containerView: UIView!
    private var imageView: UIImageView!
    private var textViewTitle: UITextView!
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
        containerView = UIView()
        imageView = UIImageView()
        textViewTitle = UITextView()


        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textViewTitle.translatesAutoresizingMaskIntoConstraints = false
    }

    override func setupViews() {
        imageView.backgroundColor = UIColor.red
        textViewTitle.textColor = UIColor.white

        containerView.addSubview(imageView)
        view.addSubview(containerView)
    }

    override func setConstraints() {
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true

    }

}

extension BreedDetailViewController: BreedDetailViewType {
    func displayBreed(_ breed: BreedDetail) {
        textViewTitle.text = breed.name
    }
}
