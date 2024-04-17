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
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//               self.navigationController?.navigationBar.shadowImage = UIImage()
               self.navigationController?.navigationBar.isTranslucent = true
               
//
//               // Remove 'Back' text and Title from Navigation Bar
               self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
              
        self.navigationItem.backBarButtonItem?.tintColor = .label
        
        navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.prefersLargeTitles = false
//
        self.navigationItem.rightBarButtonItem = .init(image: .bookmark, style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = .label
    }
}
