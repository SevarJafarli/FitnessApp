//
//  AppArrowBackButton.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//

import UIKit

class AppArrowBackButton: UIButton {

    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(.back, for: .normal)
        self.tintColor = .white
        self.addTarget(self, action: #selector(onBackBtnTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 24),
            self.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func onBackBtnTapped(navigationController: UINavigationController?) {
        navigationController?.popViewController(animated: true)
    }
}
