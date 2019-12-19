//
//  CatViewController.swift
//  TinderCat
//
//  Created by Yesid Hernandez on 4/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import UIKit
import TinderCatCore

public protocol CatViewControllerDelegate: class {
    func navigateToNextPage()
}

class CatViewController: BaseViewController {

    public weak var delegate: CatViewControllerDelegate?
    private var catList: [Cat] = []

    var containerView: UIView!
    var tableView: UITableView!

    private var innerPresenter: CatPresenterType! {
        return self.presenter as? CatPresenterType
    }

    override func initializeComponents() {
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false

        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.innerPresenter.bind(withView: self)
        self.innerPresenter.getCats()

    }
    override func setupViews() {
        containerView.backgroundColor = UIColor.red
        containerView.addSubview(tableView)
        view.addSubview(containerView)

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func setConstraints() {
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true

    }
    
    func showDetail(_ cat: Cat) {
        innerPresenter.showDetail(cat)
    }
}

extension CatViewController: CatViewType {
    func catDetail(_ cat: Cat) {
        self.delegate?.navigateToNextPage()
    }

    func displayCats(cats: [Cat]) {
        catList = cats
        self.tableView.reloadData()
    }

    func dismiss() {

    }

    func showProgress() {

    }

    func hideProgress() {

    }

}

extension CatViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return catList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.catList[indexPath.row].name
        cell.detailTextLabel?.text = catList[indexPath.row].id
        cell.accessoryType = .disclosureIndicator
        cell.isAccessibilityElement = true
        return cell
    }
}
extension CatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showDetail(self.catList[indexPath.row])
    }
}
