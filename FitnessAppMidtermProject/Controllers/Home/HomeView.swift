//
//  HomeView.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class HomeView: UIView {

    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.showsVerticalScrollIndicator = false
        
        tv.register(CategoriesViewCell.self, forCellReuseIdentifier: CategoriesViewCell.reuseIdentifier)
        tv.register(NewPartnersViewCell.self, forCellReuseIdentifier: NewPartnersViewCell.reuseIdentifier)
        tv.register(GymItemTableViewCell.self, forCellReuseIdentifier: GymItemTableViewCell.reuseIdentifier)
        return tv
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setupUI() {
        backgroundColor = .appBackground
    }
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
