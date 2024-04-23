//
//  SearchResultsViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 19.04.24.
//

import UIKit

class SearchResultsViewController: ItemsViewController {
    
    public var gyms: [GymModel] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    var isSearching = false
    
    fileprivate func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NoResultViewCell.self, forCellReuseIdentifier: NoResultViewCell.reuseIdentifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    public func configure(with gyms: [GymModel]) {
        self.gyms = gyms
        
    }
}


//MARK: - UITableViewDataSource
extension SearchResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching && gyms.isEmpty  {
            return 1
        }
        else {
            return gyms.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isSearching && gyms.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: NoResultViewCell.reuseIdentifier, for: indexPath) as! NoResultViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: GymItemTableViewCell.reuseIdentifier, for: indexPath) as! GymItemTableViewCell
            
            let model = gyms[indexPath.row]
            cell.configure(with: model)
            return cell
        }
    }
}


//MARK: - UITableViewDelegate

extension SearchResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !gyms.isEmpty {
            if let presentingViewController = presentingViewController as? SearchViewController {
                if let navigationController = presentingViewController.navigationController {
                    routeToItemDetail(model:gyms[indexPath.row], navigationController: navigationController)
                    
                }
            }
        }
    }
}
