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

class BreedDetailViewController: BaseViewController {

    private var containerView: UIView!
    private var imageView: UIImageView!
    private var titleLabel: UILabel!
    private var descriptionTextView: UITextView!
    private var favoriteButton: UIButton!
    private var tinderButton: UIButton!
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var breed: Breed!
    public weak var delegate: NavigateToNextController?

    private var innerPresenter: BreedDetailPresenterType! {
        return self.presenter as? BreedDetailPresenterType
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.innerPresenter.bind(withView: self)
        self.innerPresenter.getBreed(breed.id)
    }

    override func initializeComponents() {
        containerView = UIView()
        imageView = UIImageView()
        titleLabel = UILabel()
        descriptionTextView = UITextView()
        favoriteButton = UIButton()
        tinderButton = UIButton()

        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        tinderButton.translatesAutoresizingMaskIntoConstraints = false

    }

    override func setupViews() {
        imageView.image = UIImage(named: "logo")
        titleLabel.textColor = UIColor.greenSea
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        containerView.backgroundColor = UIColor.white

        favoriteButton.backgroundColor = UIColor.midnightBlue
        favoriteButton.layer.cornerRadius = 15
        favoriteButton.layer.masksToBounds = true
        favoriteButton.setTitle("Favorite", for: .normal)

        tinderButton.backgroundColor = UIColor.greenSea
        tinderButton.layer.cornerRadius = 15
        tinderButton.layer.masksToBounds = true
        tinderButton.setTitle("Tinder", for: .normal)
        tinderButton.addTarget(self, action: #selector(goToTinder), for: .touchUpInside)

        stackView.addArrangedSubview(tinderButton)
        stackView.addArrangedSubview(favoriteButton)
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionTextView)
        containerView.addSubview(stackView)

        view.addSubview(containerView)
    }
    
    @objc private func goToTinder(){
        innerPresenter.showTinder()
    }

    override func setConstraints() {
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true

        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true

        descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true

        stackView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: descriptionTextView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: descriptionTextView.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true

    }
    
    func getBreed(_ breed: Breed) {
        self.breed = breed
    }
}

extension BreedDetailViewController: BreedDetailViewType {
    func showTinderController() {
        self.delegate?.navigateToNextController()
    }
    
    func displayBreed(_ breed: BreedDetail) {
        titleLabel.text = breed.name
        descriptionTextView.text = breed.description
    }
}
