//
//  GymDetailViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 14.04.24.
//

import UIKit

class GymDetailViewController: UIViewController {
    
    var model: GymModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    var services: [GymServiceModel] = []{
        didSet {
            tableView.reloadData()
        }
    }
    
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.showsVerticalScrollIndicator = false
        
        tv.register(GymGeneralInfoViewCell.self, forCellReuseIdentifier: GymGeneralInfoViewCell.reuseIdentifier)
        tv.register(GymInfoViewCell.self, forCellReuseIdentifier: GymInfoViewCell.reuseIdentifier)
        
        tv.register(CategoriesViewCell.self, forCellReuseIdentifier: CategoriesViewCell.reuseIdentifier)
        
        tv.register(GymContactInfoViewCell.self, forCellReuseIdentifier: GymContactInfoViewCell.reuseIdentifier)
        
        tv.register(GymSocialAccountsViewCell.self, forCellReuseIdentifier: GymSocialAccountsViewCell.reuseIdentifier)
        
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()

    private let backBtn: AppArrowBackButton = {
        let btn = AppArrowBackButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //MARK:  - Lifecycle methods
    fileprivate func setupTableView() {
        view.addSubview(tableView)
       
        
        tableView.frame = view.bounds
        
        let headerView = HeaderView(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: 250))
        
        if let imageName = model?.gymImage {
            headerView.imageView.image = UIImage(named: imageName) ?? .fitness
        }
        
        tableView.tableHeaderView = headerView
    }
    
    fileprivate func setupBackBtn() {
        view.addSubview(backBtn)
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackground
        setupTableView()
        setupBackBtn()
        fetchServices()
    }
    
    private func fetchServices() {
        if let ids = model?.includingServiceIds {
            services = NetworkManager.shared.fetchServicesByIds(ids: ids)
        }
    }
}


//MARK: - UITableViewDataSource
extension GymDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        GymDetailViewSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = GymDetailViewSections.allCases[section]
        
        switch section {
        case .aboutInfo, .includedServices, .generalInfo, .socialMediaAccounts:
            return 1
        case .contactInfo:
            return model?.contactInfo.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = GymDetailViewSections.allCases[indexPath.section]
        
        switch section {
        case .generalInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: GymGeneralInfoViewCell.reuseIdentifier, for: indexPath) as! GymGeneralInfoViewCell
            if let model {
                cell.configure(name: model.gymName, rate: model.rating, workingHours: "\(model.openDays) : \(model.openHours)")
            }
            
            return cell
            
        case .aboutInfo:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: GymInfoViewCell.reuseIdentifier, for: indexPath) as! GymInfoViewCell
            cell.infoLabel.text = model?.about
            return cell
            
            
        case .includedServices:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesViewCell.reuseIdentifier, for: indexPath) as! CategoriesViewCell
            cell.services = services

            return cell
            
        case .contactInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: GymContactInfoViewCell.reuseIdentifier, for: indexPath) as! GymContactInfoViewCell
            
            let contactInfo = model?.contactInfo[indexPath.row]
            cell.configure(image: indexPath.row == 0 ? "phone" : "location", title: contactInfo ?? "-")

            return cell
            
        case .socialMediaAccounts:
            let cell = tableView.dequeueReusableCell(withIdentifier: GymSocialAccountsViewCell.reuseIdentifier, for: indexPath) as! GymSocialAccountsViewCell
            
            if let models = model?.socialMediaAccs {
                cell.models = models
            }
            return cell
        }
    }
}


//MARK: - UITableViewDelegate

extension GymDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionTitle = GymDetailViewSections.allCases[section].sectionTitle  else { return nil }
    
        return SectionHeaderView(title: sectionTitle)
    }
}


//MARK: - UIScrollViewDelegate
extension GymDetailViewController: UIScrollViewDelegate {
    
    fileprivate func handleScroll(_ headerView: HeaderView, _ scrollView: UIScrollView) {
        headerView.scrollViewDidScroll(scrollView)
        
        if scrollView.contentOffset.y > headerView.frame.size.height - 50 {
            title = model?.gymName
            navigationController?.isNavigationBarHidden = false
            backBtn.isHidden = true
        }
        else {
            title = nil
            navigationController?.isNavigationBarHidden = true
            backBtn.isHidden = false
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let headerView = tableView.tableHeaderView as? HeaderView else { return }
        
        handleScroll(headerView, scrollView)
    }
}
