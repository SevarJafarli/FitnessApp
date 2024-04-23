//
//  GymDetailVC+Ext.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 16.04.24.
//

import UIKit


extension GymDetailViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.showBackButton = true
        navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.prefersLargeTitles = false
    
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.isNavigationBarHidden = false
    }
}
