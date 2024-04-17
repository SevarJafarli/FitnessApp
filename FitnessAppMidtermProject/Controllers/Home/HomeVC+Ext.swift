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

        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.navigationBar.shadowImage = nil
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        
//        // Remove 'Back' text and Title from Navigation Bar
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.backBarButtonItem?.tintColor = .label
    }
    
}
