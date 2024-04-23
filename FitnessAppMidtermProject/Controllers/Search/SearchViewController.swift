//
//  SearchViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 19.04.24.
//

import UIKit

class SearchViewController: ItemsViewController {
    
    var gyms: [GymModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultsViewController())
        controller.searchBar.placeholder = "Search"
        controller.searchBar.searchBarStyle = .default
        controller.hidesNavigationBarDuringPresentation = false
        controller.obscuresBackgroundDuringPresentation = false
        return controller
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupNavbar()
        fetchGyms()
    }
    
    
    private func setupNavbar() {
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .label
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        
    }
    
    private func fetchGyms() {
        gyms = NetworkManager.shared.fetchAllGyms()
    }
}



//MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gyms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GymItemTableViewCell.reuseIdentifier, for: indexPath) as! GymItemTableViewCell
        
        let model = gyms[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}


//MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        routeToItemDetail(model: gyms[indexPath.row], navigationController: navigationController)
    }
    
    
    //animation
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.alpha = 0
//        
//        UIView.animate(withDuration: 0.5, delay: 0.2*Double(indexPath.row), animations: {
//            cell.alpha = 1
//        })
//    }
}



//MARK: - UISearchResultsUpdating

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchbar = searchController.searchBar
        
        guard let resultsController = searchController.searchResultsController as? SearchResultsViewController else {
            return
        }
        
        guard let query = searchbar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty, query.trimmingCharacters(in: .whitespaces).count >= 3 else {
            
            resultsController.isSearching = false
            
            resultsController.configure(with: [])
            return
        }
        
        
        resultsController.isSearching = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let result = NetworkManager.shared.searchGym(with: query)
            resultsController.configure(with: result)
        }
    }
}

