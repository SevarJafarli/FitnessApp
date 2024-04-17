//
//  ProfileViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let mainView: ProfileView = {
        let view = ProfileView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.delegate = self
    }
    
    private func setupNavigationBar() {
        title = "Profile"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}


//MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        SettingsModel.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsItemCell.reuseIdentifier, for: indexPath) as! SettingsItemCell
        
        let model = SettingsModel.allCases[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}


//MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = SettingsModel.allCases[indexPath.row]
        
        let vc = SettingsInfoViewController()
        vc.model = model
        navigationController?.pushViewController(vc, animated: true)
    }
}
