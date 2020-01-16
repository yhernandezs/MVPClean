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
    private var titleLabel: UILabel!
    private var descriptionTextView: UITextView!
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
        titleLabel = UILabel()
        descriptionTextView = UITextView()

        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
    }

    override func setupViews() {
        imageView.backgroundColor = UIColor.red
        titleLabel.textColor = UIColor.black
        containerView.backgroundColor = UIColor.white
        
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionTextView)

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

        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true

        descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true

    }
}

extension BreedDetailViewController: BreedDetailViewType {
    func displayBreed(_ breed: BreedDetail) {
        titleLabel.text = breed.name
        descriptionTextView.text = breed.description
    }
}
