//
//  GymDetailView.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 14.04.24.
//

import UIKit

class GymDetailView: UIView {
    private var cachedMinimumSize: CGSize?
    
//    let headerView: HeaderView = {
//        let view = HeaderView()
//   
//        return view
//    }()
    
     var tableView: UITableView = {
        let tv = UITableView()
        
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupUI()
        
        
       
       
        addSubviews()
        
        let headerView = HeaderView(frame: .init(x: 0, y: 0, width: bounds.width, height: bounds.height))
        headerView.imageView.image = .fitness
       
        tableView.tableHeaderView = headerView
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        backgroundColor = .appBackground
    }
    
    private func addSubviews() {
        addSubview(tableView)
        tableView.frame = bounds
    }
    
    
//    private func addConstraints() {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//        ])
//    }
//    
}
