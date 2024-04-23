//
//  ProfileViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(SettingsItemCell.self, forCellReuseIdentifier: SettingsItemCell.reuseIdentifier)
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
        ])
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        addSubviews()
        addConstraints()
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
