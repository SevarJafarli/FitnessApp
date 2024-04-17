//
//  SettingsInfoViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit

class SettingsInfoViewController: UIViewController {

    var model: SettingsModel?
    
    let mainView: SettingsInfoView = {
        let view = SettingsInfoView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        mainView.setDescription(model?.description)
    }
    
    private func setupNavigationBar() {
        title = model?.title
        showBackButton = true
    
    }
}
