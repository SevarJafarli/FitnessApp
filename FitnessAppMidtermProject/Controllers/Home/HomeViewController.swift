//
//  HomeViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.showsVerticalScrollIndicator = false
        
        tv.register(CategoriesViewCell.self, forCellReuseIdentifier: CategoriesViewCell.reuseIdentifier)
        tv.register(NewPartnersViewCell.self, forCellReuseIdentifier: NewPartnersViewCell.reuseIdentifier)
        tv.register(GymItemTableViewCell.self, forCellReuseIdentifier: GymItemTableViewCell.reuseIdentifier)
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    private var services: [GymServiceModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var newPartnerGyms: [GymModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var nearbyGyms: [GymModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    private func fetchServices() {
        services = NetworkManager.shared.fetchServices()
    }
    
    fileprivate func fetchGyms() {
        newPartnerGyms = NetworkManager.shared.fetchNewPartnerGyms()
        nearbyGyms = NetworkManager.shared.fetchNearbyGyms()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        fetchServices()
        fetchGyms()
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
            cell.delegate = self
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
            return GymItemTableViewCell.Constants.cellHeight
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = HomeViewSections.allCases[section]
        
        switch section {
        case .nearby, .newPartners:
            return HomeSectionHeaderView(title: section.sectionTitle!)
            
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


extension HomeViewController: CategoriesViewCellDelegate {
    func onCellSelected(model: GymServiceModel) {
        let vc = ServiceGymsViewController()
        vc.serviceModel = model
        navigationController?.pushViewController(vc, animated: true)
    }
}
