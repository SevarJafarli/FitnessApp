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
    var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.separatorStyle = .none
       
        tv.showsVerticalScrollIndicator = false
        
        tv.register(GymGeneralInfoViewCell.self, forCellReuseIdentifier: GymGeneralInfoViewCell.reuseIdentifier)
        tv.register(GymInfoViewCell.self, forCellReuseIdentifier: GymInfoViewCell.reuseIdentifier)
        
        tv.register(CategoriesViewCell.self, forCellReuseIdentifier: CategoriesViewCell.reuseIdentifier)
        
        tv.register(GymContactInfoViewCell.self, forCellReuseIdentifier: GymContactInfoViewCell.reuseIdentifier)
        
        return tv
    }()
    
    
    //MARK:  - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        
        let headerView = HeaderView(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: 250))
        
        if let imageName = model?.gymImage {
            headerView.imageView.image = UIImage(named: imageName) ?? .fitness
        }

        tableView.tableHeaderView = headerView
        
        //        addConstraints()
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
        case .aboutInfo, .includedServices:
            return 1
        case .contactInfo:
            return model?.contactInfo?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = GymDetailViewSections.allCases[indexPath.section]
        
        switch section {
        case .aboutInfo:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: GymInfoViewCell.reuseIdentifier, for: indexPath) as! GymInfoViewCell
            cell.infoLabel.text = model?.about
            return cell
            
            
        case .includedServices:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesViewCell.reuseIdentifier, for: indexPath) as! CategoriesViewCell
            return cell
            
            //TODO: change it
        case .contactInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: GymContactInfoViewCell.reuseIdentifier, for: indexPath) as! GymContactInfoViewCell
            
            let contactInfo = model?.contactInfo?[indexPath.row]
            cell.configure(image: indexPath.row == 0 ? "phone" : "location", title: contactInfo ?? "-")
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = GymDetailViewSections.allCases[section].sectionTitle
        
        return SectionHeaderView(title: sectionTitle)
    }
}


//MARK: - UITableViewDelegate

extension GymDetailViewController: UITableViewDelegate {
    
}


//MARK: - UIScrollViewDelegate
extension GymDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let headerView = tableView.tableHeaderView as? HeaderView else { return }
        
        headerView.scrollViewDidScroll(scrollView)
    
        
        if scrollView.contentOffset.y > headerView.frame.size.height {
            title = "Arslan"
            
            navigationController?.isNavigationBarHidden = false
        }
        else {
            title = nil
            
            navigationController?.isNavigationBarHidden = true

        }
    }
}
