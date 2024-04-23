//
//  ItemsViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 19.04.24.
//

import UIKit

class ItemsViewController: UIViewController {

    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.rowHeight = GymItemTableViewCell.Constants.cellHeight
        tv.showsVerticalScrollIndicator = false
        tv.register(GymItemTableViewCell.self, forCellReuseIdentifier: GymItemTableViewCell.reuseIdentifier)
        tv.translatesAutoresizingMaskIntoConstraints = false
       
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addSubviews()
        addConstraints()
    }
    

    private func setupUI() {
        self.view.backgroundColor = .appBackground
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    public func routeToItemDetail(model: GymModel, navigationController: UINavigationController?) {
        let vc = GymDetailViewController()
        vc.model = model
        navigationController?.pushViewController(vc, animated: true)
    }
}


