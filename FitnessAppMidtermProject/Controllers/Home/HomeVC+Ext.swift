//
//  HomeVC+Ext.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 16.04.24.
//

import UIKit

//MARK: - SetupNavbar
extension HomeViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.navigationItem.backBarButtonItem?.tintColor = .label
    }
    
}
