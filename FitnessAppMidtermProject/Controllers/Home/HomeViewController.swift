//
//  HomeViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let mainView: HomeView = {
        let view = HomeView()
        return view
    }()
    
    private var services = [GymServiceModel]()
    private var newPartnerGyms = [GymModel]()
    private var nearbyGyms = [GymModel]()
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }
    fileprivate func fetchData() {
        if let res = HomeDataManager.shared.loadData() {
            services = res.services
            newPartnerGyms = res.newPartners
            nearbyGyms = res.nearby
            
            mainView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        fetchData()
    }
    
    
    private func setupNavigationBar() {
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        let searchBtn = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: nil)

        searchBtn.tintColor = .label
       
        self.navigationItem.rightBarButtonItem = searchBtn
    }
    
    @objc private func onSavedBtnTapped() {
        
    }
}


//MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        HomeViewSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let section = HomeViewSections.allCases[section]
        
        switch section {
        case .categories, .newPartners:
            return 1
        case .nearby:
            return nearbyGyms.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = HomeViewSections.allCases[indexPath.section]
        
        switch section {
            
        case .categories:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesViewCell.reuseIdentifier, for: indexPath) as! CategoriesViewCell
           
            cell.services = services
            return cell
        
        case .newPartners:
            let cell = tableView.dequeueReusableCell(withIdentifier: NewPartnersViewCell.reuseIdentifier, for: indexPath) as! NewPartnersViewCell
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            return cell
            
        case .nearby:
            let cell = tableView.dequeueReusableCell(withIdentifier: GymItemTableViewCell.reuseIdentifier, for: indexPath) as! GymItemTableViewCell
            let model = nearbyGyms[indexPath.row]
            cell.configure(with: model)
            return cell
        }
    }
}



//MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = HomeViewSections.allCases[indexPath.section]
        
        switch section {
            
        case .nearby:
            return 240
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = HomeViewSections.allCases[section]
        
        switch section {
        case .nearby:
            return HomeSectionHeaderView(title: "Nearby")
        case .newPartners:
            return HomeSectionHeaderView(title: "New Partners")
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = HomeViewSections.allCases[indexPath.section]
        
        switch section {
        case .nearby:
            let vc = GymDetailViewController()
            let model = nearbyGyms[indexPath.row]
            vc.model = model
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}


//MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newPartnerGyms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GymItemCollectionViewCell.reuseIdentifier, for: indexPath) as! GymItemCollectionViewCell
        
        let model = newPartnerGyms[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}


//MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = GymDetailViewController()
        let model = newPartnerGyms[indexPath.row]
        vc.model = model
        navigationController?.pushViewController(vc, animated: true)
    }
}
