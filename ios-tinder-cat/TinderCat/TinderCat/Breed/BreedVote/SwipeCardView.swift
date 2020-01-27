//
//  SwipeCardView.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 27/01/20.
//  Copyright © 2020 Yesid Hernandez. All rights reserved.
//

import UIKit
import TinderCatCore

class SwipeCardView: UIView {

    //MARK: - Properties
    var swipeView: UIView!
    var shadowView: UIView!
    var imageView: UIImageView!
    var delegate: SwipeCardsDelegate?
    var divisor: CGFloat = 0
    let baseView = UIView()

    var dataSource: FavoriteBreed? {
        didSet {
            swipeView.backgroundColor = UIColor.gray
            let url = NSURL(string: dataSource!.image)
            imageView.load(url: url! as URL)
        }
    }


    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureShadowView()
        configureSwipeView()
        configureImageView()
        addPanGestureOnCards()
        configureTapGesture()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Configuration

    func configureShadowView() {
        shadowView = UIView()
        shadowView.backgroundColor = .clear
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.shadowOpacity = 0.8
        shadowView.layer.shadowRadius = 4.0
        addSubview(shadowView)

        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    func configureSwipeView() {
        swipeView = UIView()
        swipeView.layer.cornerRadius = 15
        swipeView.clipsToBounds = true
        shadowView.addSubview(swipeView)

        swipeView.translatesAutoresizingMaskIntoConstraints = false
        swipeView.leftAnchor.constraint(equalTo: shadowView.leftAnchor).isActive = true
        swipeView.rightAnchor.constraint(equalTo: shadowView.rightAnchor).isActive = true
        swipeView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor).isActive = true
        swipeView.topAnchor.constraint(equalTo: shadowView.topAnchor).isActive = true
    }

    func configureImageView() {
        imageView = UIImageView()
        swipeView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.centerXAnchor.constraint(equalTo: swipeView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: swipeView.centerYAnchor, constant: -30).isActive = true
        imageView.leftAnchor.constraint(equalTo: shadowView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: shadowView.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: shadowView.topAnchor).isActive = true

    }

    func configureTapGesture() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGesture)))
    }


    func addPanGestureOnCards() {
        self.isUserInteractionEnabled = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }



    //MARK: - Handlers
    @objc func handlePanGesture(sender: UIPanGestureRecognizer) {
        let card = sender.view as! SwipeCardView
        let point = sender.translation(in: self)
        let centerOfParentContainer = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y)

        divisor = ((UIScreen.main.bounds.width / 2) / 0.61)

        switch sender.state {
        case .ended:
            if (card.center.x) > 400 {
                delegate?.swipeDidEnd(on: card)
                UIView.animate(withDuration: 0.2) {
                    card.center = CGPoint(x: centerOfParentContainer.x + point.x + 200, y: centerOfParentContainer.y + point.y + 75)
                    card.alpha = 0
                    self.layoutIfNeeded()
                }
                return
            } else if card.center.x < -65 {
                delegate?.swipeDidEnd(on: card)
                UIView.animate(withDuration: 0.2) {
                    card.center = CGPoint(x: centerOfParentContainer.x + point.x - 200, y: centerOfParentContainer.y + point.y + 75)
                    card.alpha = 0
                    self.layoutIfNeeded()
                }
                return
            }
            UIView.animate(withDuration: 0.2) {
                card.transform = .identity
                card.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
                self.layoutIfNeeded()
            }
        case .changed:
            let rotation = tan(point.x / (self.frame.width * 2.0))
            card.transform = CGAffineTransform(rotationAngle: rotation)

        default:
            break
        }
    }

    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
    }


}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
